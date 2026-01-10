import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../core/utils/constants.dart';
import '../core/utils/strings.dart';
import '../models/summary_model.dart';
import '../widgets/failure_widget.dart';
import '../widgets/job_cell.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({super.key});

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  int? selectedRow;
  late ScrollController _horizontalController, _verticalController;
  late Future<List<SummaryModel>> _future;

  @override
  void initState() {
    _horizontalController = ScrollController();
    _verticalController = ScrollController();
    _future = getSummary();
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
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return FailureWidget(
            message: snapshot.error!.toString(),
            onRetry: () {
              _future = getSummary();
              setState(() {});
            },
          );
        } else if (snapshot.hasData) {
          return Scrollbar(
            interactive: true,
            controller: _verticalController,
            scrollbarOrientation: ScrollbarOrientation.left,
            child: Scrollbar(
              interactive: true,
              controller: _horizontalController,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: RefreshIndicator(
                onRefresh: () async {
                  _future = getSummary();
                  setState(() {});
                },
                child: TableView.builder(
                  // diagonalDragBehavior: DiagonalDragBehavior.free,
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
                  rowCount: snapshot.data!.length + 1,
                  columnCount: SummaryModel.summaryHeaders.length,
                  rowBuilder: (rowIndex) => rowIndex == 0
                      ? const TableSpan(extent: FixedTableSpanExtent(60))
                      : const TableSpan(extent: FixedTableSpanExtent(45)),

                  columnBuilder: (colIndex) {
                    switch (colIndex) {
                      case 0:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(80),
                        );
                      case 1:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(90),
                        );
                      case 2:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(120),
                        );
                      case 3:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(150),
                        );
                      case 4:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(100),
                        );
                      case 5:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(120),
                        );
                      case 6:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(200),
                        );
                      case 7:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(100),
                        );
                      default:
                        return const TableSpan(
                          extent: FixedTableSpanExtent(100),
                        );
                    }
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
                            setState(() {});
                            return;
                          }
                          selectedRow = vicinity.row;
                          setState(() {});
                        },
                        child: JobCell(
                          label: isHeader
                              ? SummaryModel.summaryHeaders[vicinity.column]
                              : snapshot.data![vicinity.row - 1]
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
          );
        }
        return SizedBox();
      },
    );
  }

  Future<List<SummaryModel>> getSummary() async {
    try {
      print("get summary");
      Response res = await GetIt.I<Client>().get(
        Uri.parse(Constants.getSummary),
      );
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        List<SummaryModel> summaryData = [];
        for (final Map<String, dynamic> json in data)
          summaryData.add(SummaryModel.fromJson(json));
        return summaryData;
      } else if (res.statusCode == 400) {
        return Future.error(jsonDecode(res.body)["message"]);
      } else {
        return Future.error(
          Strings.unknownError(statusCode: res.statusCode, body: res.body),
        );
      }
    } catch (e) {
      print(e);
      return Future.error(Strings.unexpectedError);
    }
  }
}
