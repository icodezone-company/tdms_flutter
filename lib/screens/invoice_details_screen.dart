import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../models/invoice_details.dart';
import '../widgets/job_cell.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key, required this.details});
  final List<InvoiceDetail> details;
  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  int? selectedRow;
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
      appBar: AppBar(title: Text("تفاصيل الفاتورة")),
      body: Scrollbar(
        interactive: true,
        controller: _verticalController,
        scrollbarOrientation: ScrollbarOrientation.left,
        child: Scrollbar(
          interactive: true,
          controller: _horizontalController,
          scrollbarOrientation: ScrollbarOrientation.bottom,
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
            rowCount: widget.details.length + 1,
            columnCount: InvoiceDetail.invoiceDetailHeaders.length,
            rowBuilder: (rowIndex) => rowIndex == 0
                ? const TableSpan(extent: FixedTableSpanExtent(60))
                : const TableSpan(extent: FixedTableSpanExtent(45)),
            // Column widths
            columnBuilder: (colIndex) {
              switch (colIndex) {
                case 0:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(80),
                  ); // id
                case 1:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(90),
                  ); // inv_id
                case 2:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(120),
                  ); // fabric_source
                case 3:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(120),
                  ); // fabric_type
                case 4:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(100),
                  ); // fabric_weight
                case 5:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(100),
                  ); // bolt_count
                case 6:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(120),
                  ); // gath_fabric_w
                case 7:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(120),
                  ); // gath_fabric_c
                case 8:
                  return const TableSpan(
                    extent: FixedTableSpanExtent(120),
                  ); // fabric_kind
                default:
                  return const TableSpan(extent: FixedTableSpanExtent(100));
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
                        ? InvoiceDetail.invoiceDetailHeaders[vicinity.column]
                        : widget.details[vicinity.row - 1]
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
}
