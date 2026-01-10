import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../core/themes/app_colors.dart';
import '../core/themes/app_sized.dart';
import '../core/utils/app_messages.dart';
import '../core/utils/constants.dart';
import '../core/utils/strings.dart';
import '../dialogs/send_to_dialog.dart';
import '../dialogs/start_work_dialog.dart';
import '../models/job.dart';
import '../models/tracking.dart';
import '../models/user.dart';
import '../widgets/app_button.dart';
import '../widgets/job_cell.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({
    super.key,
    required this.job,
    required this.fromSection,
    required this.trackingList,
    this.showOptions = true,
  });
  final Job? job;
  final String? fromSection;
  final List<Tracking> trackingList;
  final bool showOptions;
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  int? selectedRow;
  Tracking? selectedTracking;
  late ScrollController _horizontalController, _verticalController;

  bool isLoading = false;

  @override
  void initState() {
    _horizontalController = ScrollController();
    _verticalController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مراحل العمل")),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              interactive: true,
              controller: _verticalController,
              scrollbarOrientation: ScrollbarOrientation.left,
              child: Scrollbar(
                interactive: true,
                controller: _horizontalController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: TableView.builder(
                  diagonalDragBehavior: DiagonalDragBehavior.free,
                  horizontalDetails: ScrollableDetails(
                    direction: AxisDirection.left,
                    controller: _horizontalController,
                  ),
                  verticalDetails: ScrollableDetails(
                    physics: AlwaysScrollableScrollPhysics(),
                    direction: AxisDirection.down,
                    controller: _verticalController,
                  ),
                  pinnedRowCount: 1,
                  rowCount: widget.trackingList.length + 1,
                  columnCount: Tracking.tableHeaders.length,
                  rowBuilder: (rowIndex) => rowIndex == 0
                      ? const TableSpan(extent: FixedTableSpanExtent(60))
                      : const TableSpan(extent: FixedTableSpanExtent(45)),
                  columnBuilder: (columnIndex) {
                    switch (columnIndex) {
                      case 0:
                      case 1:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(100),
                        );
                      case 2:
                      case 3:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(140),
                        );
                      case 4:
                      case 5:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(100),
                        );
                    }
                    return const TableSpan(extent: FixedTableSpanExtent(120));
                  },
                  cellBuilder: (context, vicinity) {
                    final bool isHeader = vicinity.row == 0;
                    final bool isSelected = vicinity.row == selectedRow;
                    return TableViewCell(
                      child: GestureDetector(
                        onTap: () {
                          if (isHeader) return;
                          if (isSelected) {
                            selectedRow = null;
                            selectedTracking = null;
                            setState(() {});
                            return;
                          }
                          selectedRow = vicinity.row;
                          selectedTracking =
                              widget.trackingList[vicinity.row - 1];
                          setState(() {});
                        },
                        child: JobCell(
                          label: isHeader
                              ? Tracking.tableHeaders[vicinity.column]
                              : widget.trackingList[vicinity.row - 1]
                                    .toTableRow()[vicinity.column],
                          isHeader: isHeader,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (widget.showOptions)
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingMD),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            title: "بدء العمل",
                            onPressed: selectedRow == null
                                ? null
                                : () async {
                                    final Map<String, dynamic>? body =
                                        await showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => StartWorkDialog(
                                            tracking: selectedTracking!,
                                          ),
                                        );
                                    if (body == null) return;
                                    print(body);
                                    isLoading = true;
                                    setState(() {});
                                    await startWork(body);
                                    isLoading = false;
                                    setState(() {});
                                  },
                          ),
                        ),
                        const SizedBox(width: AppSizes.paddingMD),
                        Expanded(
                          child: AppButton(
                            title: "إرسال إلى",
                            onPressed: selectedRow == null
                                ? null
                                : () async {
                                    final Map<String, dynamic>? body =
                                        await showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => SendToDialog(
                                            tracking: selectedTracking!,
                                          ),
                                        );
                                    if (body == null) return;
                                    body.addAll({
                                      "job_id": widget.job!.id,
                                      "created_by": User.fromJson(
                                        jsonDecode(
                                          GetIt.I<SharedPreferences>()
                                              .getString(Constants.userKey)!,
                                        ),
                                      ).userName,
                                      "from_section": widget.fromSection,
                                      "dyeing_weight": widget.job!.dyeingWeight,
                                      "bolt_count": widget.job!.boltCount,
                                      "gath_fabric_w": widget.job!.gathFabricW,
                                      "gath_fabric_c": widget.job!.gathFabricC,
                                    });
                                    print(jsonEncode(body));
                                    isLoading = true;
                                    setState(() {});
                                    await sendTo(body);
                                    isLoading = false;
                                    setState(() {});
                                  },
                          ),
                        ),
                      ],
                    ),
            ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom),
        ],
      ),
    );
  }

  Future<void> startWork(Map<String, dynamic> body) async {
    try {
      Response res = await GetIt.I<Client>().post(
        Uri.parse(Constants.startWork),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
      if (!mounted) return;
      if (res.statusCode == 200) {
        AppMessages.success(context);
      } else if (res.statusCode == 400) {
        AppMessages.error(context, message: jsonDecode(res.body)["message"]);
      } else {
        AppMessages.error(
          context,
          message: Strings.unknownError(
            statusCode: res.statusCode,
            body: res.body,
          ),
        );
      }
    } catch (e) {
      AppMessages.error(context);
    }
  }

  Future<void> sendTo(Map<String, dynamic> body) async {
    try {
      Response res = await GetIt.I<Client>().post(
        Uri.parse(Constants.sendTo),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
      if (!mounted) return;
      if (res.statusCode == 200) {
        AppMessages.success(context);
      } else if (res.statusCode == 400) {
        AppMessages.error(context, message: jsonDecode(res.body)["message"]);
      } else {
        AppMessages.error(
          context,
          message: Strings.unknownError(
            statusCode: res.statusCode,
            body: res.body,
          ),
        );
      }
    } catch (e) {
      AppMessages.error(context);
    }
  }
}
