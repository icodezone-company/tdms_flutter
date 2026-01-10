import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../core/utils/constants.dart';
import '../core/utils/strings.dart';
import '../models/ready_material.dart';
import '../widgets/failure_widget.dart';
import '../widgets/filter_bar.dart';
import '../widgets/job_cell.dart';

class WarehouseReadyScreen extends StatefulWidget {
  const WarehouseReadyScreen({super.key});

  @override
  State<WarehouseReadyScreen> createState() => _WarehouseReadyScreenState();
}

class _WarehouseReadyScreenState extends State<WarehouseReadyScreen> {
  int? selectedRow;
  late ScrollController _horizontalController, _verticalController;
  late Future<List<ReadyMaterial>> _future;
  bool isLoading = false;

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  String customerName = "";

  @override
  void initState() {
    _horizontalController = ScrollController();
    _verticalController = ScrollController();
    _future = getAllReadyMaterials(
      customerName: customerName,
      fromDate: fromDate,
      toDate: toDate,
    );
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
      appBar: AppBar(title: Text("مستودع المواد الجاهزة")),
      body: Column(
        children: [
          FilterBar(
            isLoading: isLoading,
            customerName: customerName,
            fromDate: fromDate,
            toDate: toDate,
            onChanged: (customerName, fromDate, toDate) {
              this.customerName = customerName;
              this.fromDate = fromDate;
              this.toDate = toDate;
              _future = getAllReadyMaterials(
                customerName: customerName,
                fromDate: fromDate,
                toDate: toDate,
              );
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return FailureWidget(
                    message: snapshot.error!.toString(),
                    onRetry: () {
                      _future = getAllReadyMaterials(
                        customerName: customerName,
                        fromDate: fromDate,
                        toDate: toDate,
                      );
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
                          _future =
                              getAllReadyMaterials(
                                customerName: customerName,
                                fromDate: fromDate,
                                toDate: toDate,
                              );
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
                          columnCount:
                              ReadyMaterial.readyMaterialHeaders.length,
                          rowBuilder: (rowIndex) => rowIndex == 0
                              ? const TableSpan(
                                  extent: FixedTableSpanExtent(60),
                                )
                              : const TableSpan(
                                  extent: FixedTableSpanExtent(45),
                                ),
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
                            return const TableSpan(
                              extent: FixedTableSpanExtent(120),
                            );
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
                                      ? ReadyMaterial
                                            .readyMaterialHeaders[vicinity
                                            .column]
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
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ReadyMaterial>> getAllReadyMaterials({
    required String customerName,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    isLoading = true;
    setState(() {});
    try {
      Response res = await GetIt.I<Client>().get(
        Uri.parse(
          "${Constants.getReadyMaterialReport}?from_date=${fromDate.formateDateReverse}&to_date=${toDate.formateDateReverse}",
        ),
      );
      isLoading = false;
      setState(() {});
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        List<ReadyMaterial> materials = [];
        for (final Map<String, dynamic> json in data)
          materials.add(ReadyMaterial.fromJson(json));
        return materials;
      } else if (res.statusCode == 400) {
        return Future.error(jsonDecode(res.body)["message"]);
      } else {
        return Future.error(
          Strings.unknownError(statusCode: res.statusCode, body: res.body),
        );
      }
    } catch (e) {
      isLoading = false;
      setState(() {});
      return Future.error(Strings.unexpectedError);
    }
  }
}
