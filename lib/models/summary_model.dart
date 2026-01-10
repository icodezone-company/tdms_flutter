import 'package:tdms_flutter/core/utils/constants.dart';

class SummaryModel {
  final int invoiceNo;
  final DateTime invoiceDate;
  final String customerName;

  final String fabricSource;
  final String fabricGroup;

  final double baseWeight;
  final int fabricBoltCount;

  final double receivedRibWeight;
  final int receivedRibBoltCount;

  final double totalCurrentWeight;
  final int totalCurrentBoltCount;

  final double totalRibWeight;
  final int totalRibBoltCount;

  final double remainingFabricWeight;
  final int remainingFabricBoltCount;

  final double remainingRibWeight;
  final int remainingRibBoltCount;

  SummaryModel({
    required this.invoiceNo,
    required this.invoiceDate,
    required this.customerName,
    required this.fabricSource,
    required this.fabricGroup,
    required this.baseWeight,
    required this.fabricBoltCount,
    required this.receivedRibWeight,
    required this.receivedRibBoltCount,
    required this.totalCurrentWeight,
    required this.totalCurrentBoltCount,
    required this.totalRibWeight,
    required this.totalRibBoltCount,
    required this.remainingFabricWeight,
    required this.remainingFabricBoltCount,
    required this.remainingRibWeight,
    required this.remainingRibBoltCount,
  });
  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      invoiceNo: json["رقم الفاتورة"],
      invoiceDate: DateTime.parse(json["تاريخ الفاتورة"]),
      customerName: json["اسم الزبون"],

      fabricSource: json["مصدر القماش"],
      fabricGroup: json["الزمرة"],

      baseWeight: (json["اساس الوزن"] as num).toDouble(),
      fabricBoltCount: json["عدد أثواب القماش"],

      receivedRibWeight: (json["وزن الريب المستلم"] as num).toDouble(),
      receivedRibBoltCount: json["عدد أثواب الريب المستلم"],

      totalCurrentWeight: (json["إجمالي الوزن القائم"] as num).toDouble(),
      totalCurrentBoltCount: json["إجمالي عدد أثواب القماش"],

      totalRibWeight: (json["إجمالي وزن الريب"] as num).toDouble(),
      totalRibBoltCount: json["إجمالي أثواب الريب"],

      remainingFabricWeight: (json["وزن القماش المتبقي"] as num).toDouble(),
      remainingFabricBoltCount: json["أثواب القماش المتبقية"],

      remainingRibWeight: (json["وزن الريب المتبقي"] as num).toDouble(),
      remainingRibBoltCount: json["عدد أثواب الريب المتبقية"],
    );
  }

  static const List<String> summaryHeaders = [
    "رقم الفاتورة",
    "تاريخ الفاتورة",
    "اسم الزبون",
    "مصدر القماش",
    "الزمرة",
    "اساس الوزن",
    "عدد أثواب القماش",
    "وزن الريب المستلم",
    "عدد أثواب الريب المستلم",
    "إجمالي الوزن القائم",
    "إجمالي عدد أثواب القماش",
    "إجمالي وزن الريب",
    "إجمالي أثواب الريب",
    "وزن القماش المتبقي",
    "أثواب القماش المتبقية",
    "وزن الريب المتبقي",
    "عدد أثواب الريب المتبقية",
  ];

  List<String> toTableRow() {
    return [
      invoiceNo.toString(),
      invoiceDate.formateDate,
      customerName,
      fabricSource,
      fabricGroup,
      baseWeight.toStringAsFixed(0),
      fabricBoltCount.toString(),
      receivedRibWeight.toStringAsFixed(0),
      receivedRibBoltCount.toString(),
      totalCurrentWeight.toStringAsFixed(0),
      totalCurrentBoltCount.toString(),
      totalRibWeight.toStringAsFixed(0),
      totalRibBoltCount.toString(),
      remainingFabricWeight.toStringAsFixed(0),
      remainingFabricBoltCount.toString(),
      remainingRibWeight.toStringAsFixed(0),
      remainingRibBoltCount.toString(),
    ];
  }
}
