import 'package:tdms_flutter/core/utils/constants.dart';

import 'invoice_details.dart';

class Invoice {
  final int id;
  final int lotNo;
  final DateTime lotDate;
  final String customerName;
  final int invNo;
  final DateTime invDate;
  final String note;
  final List<InvoiceDetail> details;

  Invoice({
    required this.id,
    required this.lotNo,
    required this.lotDate,
    required this.customerName,
    required this.invNo,
    required this.invDate,
    required this.note,
    required this.details,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json["id"],
      lotNo: json["lot_no"],
      lotDate: DateTime.parse(json["lot_date"]),
      customerName: json["cutomer_name"],
      invNo: json["inv_no"],
      invDate: DateTime.parse(json["inv_date"]),
      note: json["note"] ?? "",
      details: (json["details"] as List<dynamic>)
          .map((e) => InvoiceDetail.fromJson(e))
          .toList(),
    );
  }

  static const List<String> invoiceHeaders = [
    "معرف الفاتورة", // id
    "رقم اللوت", // lot_no
    "تاريخ اللوت", // lot_date
    "اسم الزبون", // customer_name
    "رقم الفاتورة", // inv_no
    "تاريخ الفاتورة", // inv_date
    "ملاحظات", // note
    "عدد التفاصيل", // details.length
  ];

  /// Top-level fields for table
  List<String> toTableRow() {
    return [
      id.toString(),
      lotNo.toString(),
      lotDate.formateDate,
      customerName,
      invNo.toString(),
      invDate.formateDate,
      note,
      details.length.toString(), // show number of details
    ];
  }
}
