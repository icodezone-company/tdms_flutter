import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../core/utils/constants.dart';
import '../core/utils/strings.dart';
import '../models/job.dart';
import '../widgets/failure_widget.dart';
import '../widgets/job_cell.dart';
import 'tracking_screen.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key, required this.dyeingPart});
  final int dyeingPart;

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  int? selectedRow;
  late ScrollController _horizontalController, _verticalController;
  late Future<List<Job>> _future;
  bool isLoading = false;

  bool insert = true;

  @override
  void initState() {
    _horizontalController = ScrollController();
    _verticalController = ScrollController();
    _future = getAllJobs(widget.dyeingPart);
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
      appBar: AppBar(title: Text(Constants.dyeingById[widget.dyeingPart]!)),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return FailureWidget(
              message: snapshot.error!.toString(),
              onRetry: () {
                _future = getAllJobs(widget.dyeingPart);
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
                    _future = getAllJobs(widget.dyeingPart);
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
                    columnCount: Job.tableHeaders.length,
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
                          onLongPress: () async {
                            if (isHeader) return;
                            if (selectedRow != vicinity.row) {
                              selectedRow = vicinity.row;
                              setState(() {});
                            }
                            final bool refresh =
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TrackingScreen(
                                      job: snapshot.data![vicinity.row - 1],
                                      fromSection: Constants
                                          .dyeingById[widget.dyeingPart],
                                      trackingList: snapshot
                                          .data![vicinity.row - 1]
                                          .tracking,
                                    ),
                                  ),
                                ) ??
                                false;
                            if (refresh) {
                              _future = getAllJobs(widget.dyeingPart);
                              setState(() {});
                            }
                          },
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
                                ? Job.tableHeaders[vicinity.column]
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
    );
  }

  Future<List<Job>> getAllJobs(int status) async {
    try {
      Response res = await GetIt.I<Client>().get(
        Uri.parse("${Constants.getJobs}/${widget.dyeingPart}"),
      );
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        List<Job> jobs = [];
        for (final Map<String, dynamic> json in data)
          jobs.add(Job.fromJson(json));
        return jobs;
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
