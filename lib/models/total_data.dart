import 'package:tdms_flutter/core/utils/constants.dart';

class TotalData {
  final int invoiceId;
  final int customerInvoiceNo;
  final DateTime customerInvoiceDate;
  final String customerName;
  final int invoiceNo;
  final DateTime invoiceDate;
  final String invoiceNote;

  final int invDetailId;
  final String fabricSource;
  final String fabricGroup;
  final String fabricType;
  final int baseWeight;
  final int fabricBoltCount;
  final int receivedRibWeight;
  final int receivedRibBoltCount;

  final int dyeingOrderId;
  final int orderNo;
  final DateTime orderDate;
  final String orderNote;

  final String relaxing;
  final String scouring;
  final String raising;
  final String pressing;
  final String fixation;
  final String brushing;
  final String tshek;
  final String print;
  final String process;
  final String shaving;
  final String dyeing;
  final String other;

  final int orderMovementQty;

  final int orderDetailId;
  final String colorName;
  final int colorNo;
  final int currentWeight;
  final int currentBoltCount;
  final int remainingWeight;
  final int remainingBoltCount;
  final int currentRibWeight;
  final int usedRibBoltCount;
  final int remainingRibWeight;
  final int remainingRibBoltCount;

  final int width;
  final int grammage;
  final int status;
  final String statusName;

  TotalData({
    required this.invoiceId,
    required this.customerInvoiceNo,
    required this.customerInvoiceDate,
    required this.customerName,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.invoiceNote,
    required this.invDetailId,
    required this.fabricSource,
    required this.fabricGroup,
    required this.fabricType,
    required this.baseWeight,
    required this.fabricBoltCount,
    required this.receivedRibWeight,
    required this.receivedRibBoltCount,
    required this.dyeingOrderId,
    required this.orderNo,
    required this.orderDate,
    required this.orderNote,
    required this.relaxing,
    required this.scouring,
    required this.raising,
    required this.pressing,
    required this.fixation,
    required this.brushing,
    required this.tshek,
    required this.print,
    required this.process,
    required this.shaving,
    required this.dyeing,
    required this.other,
    required this.orderMovementQty,
    required this.orderDetailId,
    required this.colorName,
    required this.colorNo,
    required this.currentWeight,
    required this.currentBoltCount,
    required this.remainingWeight,
    required this.remainingBoltCount,
    required this.currentRibWeight,
    required this.usedRibBoltCount,
    required this.remainingRibWeight,
    required this.remainingRibBoltCount,
    required this.width,
    required this.grammage,
    required this.status,
    required this.statusName,
  });
  factory TotalData.fromJson(Map<String, dynamic> json) {
    return TotalData(
      invoiceId: json["invoice_id"],
      customerInvoiceNo: json["رقم فاتورة الزبون"],
      customerInvoiceDate: DateTime.parse(json["تاريخ فاتورة الزبون"]),
      customerName: json["اسم الزبون"],
      invoiceNo: json["رقم الفاتورة"],
      invoiceDate: DateTime.parse(json["تاريخ الفاتورة"]),
      invoiceNote: json["ملاحظات الفانورة"],

      invDetailId: json["inv_detail_id"],
      fabricSource: json["مصدر القماش"],
      fabricGroup: json["الزمرة"],
      fabricType: json["نوع القماش"],
      baseWeight: json["اساس الوزن"],
      fabricBoltCount: json["عدد اثواب القماش"],
      receivedRibWeight: json["وزن الريب المستلم"],
      receivedRibBoltCount: json["عدد اثواب الريب المستلم"],

      dyeingOrderId: json["dyeing_order_id"],
      orderNo: json["رقم التوجيه"],
      orderDate: DateTime.parse(json["تاريخ التوجيه"]),
      orderNote: json["ملاحظات التوجيه"],

      relaxing: json["تطرية"],
      scouring: json["غسيل"],
      raising: json["نفش"],
      pressing: json["كوي"],
      fixation: json["تثبيت"],
      brushing: json["سنفرة"],
      tshek: json["تلميع"],
      print: json["طباعة"],
      process: json["معالجة"],
      shaving: json["حلاقة"],
      dyeing: json["صباغة"],
      other: json["أشياء أخرى"] ?? "",

      orderMovementQty: json["order_movement_qty"],

      orderDetailId: json["order_detail_id"],
      colorName: json["اسم اللون"],
      colorNo: json["رقم اللون"],
      currentWeight: json["الوزن القائم"],
      currentBoltCount: json["عدد الأثواب"],
      remainingWeight: json["الوزن المتبقي"],
      remainingBoltCount: json["الأثواب المتبقية"],
      currentRibWeight: json["وزن الريب القائم"],
      usedRibBoltCount: json["عدد أثواب الريب المستخدمة"],
      remainingRibWeight: json["وزن الريب المتبقي"],
      remainingRibBoltCount: json["عدد أثواب الريب المتبقية"],

      width: json["العرض"],
      grammage: json["غراماح"],
      status: json["status"],
      statusName: json["الحالة"],
    );
  }
  static const List<String> totalDataHeaders = [
    "معرف الفاتورة",
    "رقم فاتورة الزبون",
    "تاريخ فاتورة الزبون",
    "اسم الزبون",
    "رقم الفاتورة",
    "تاريخ الفاتورة",
    "ملاحظات الفاتورة",

    "معرف تفاصيل الفاتورة",
    "مصدر القماش",
    "الزمرة",
    "نوع القماش",
    "أساس الوزن",
    "عدد أثواب القماش",
    "وزن الريب المستلم",
    "عدد أثواب الريب المستلم",

    "معرف التوجيه",
    "رقم التوجيه",
    "تاريخ التوجيه",
    "ملاحظات التوجيه",

    "تطرية",
    "غسيل",
    "نفش",
    "كوي",
    "تثبيت",
    "سنفرة",
    "تلميع",
    "طباعة",
    "معالجة",
    "حلاقة",
    "صباغة",
    "أشياء أخرى",

    "الكمية المنقولة",

    "معرف تفاصيل التوجيه",
    "اسم اللون",
    "رقم اللون",
    "الوزن القائم",
    "عدد الأثواب",
    "الوزن المتبقي",
    "الأثواب المتبقية",
    "وزن الريب القائم",
    "عدد أثواب الريب المستخدمة",
    "وزن الريب المتبقي",
    "عدد أثواب الريب المتبقية",

    "العرض",
    "غراماج",
    "كود الحالة",
    "الحالة",
  ];

  List<String> toTableRow() {
    return [
      invoiceId.toString(),
      customerInvoiceNo.toString(),
      customerInvoiceDate.formateDate,
      customerName,
      invoiceNo.toString(),
      invoiceDate.formateDate,
      invoiceNote,

      invDetailId.toString(),
      fabricSource,
      fabricGroup,
      fabricType,
      baseWeight.toString(),
      fabricBoltCount.toString(),
      receivedRibWeight.toString(),
      receivedRibBoltCount.toString(),

      dyeingOrderId.toString(),
      orderNo.toString(),
      orderDate.formateDate,
      orderNote,

      relaxing,
      scouring,
      raising,
      pressing,
      fixation,
      brushing,
      tshek,
      print,
      process,
      shaving,
      dyeing,
      other,

      orderMovementQty.toString(),

      orderDetailId.toString(),
      colorName,
      colorNo.toString(),
      currentWeight.toString(),
      currentBoltCount.toString(),
      remainingWeight.toString(),
      remainingBoltCount.toString(),
      currentRibWeight.toString(),
      usedRibBoltCount.toString(),
      remainingRibWeight.toString(),
      remainingRibBoltCount.toString(),

      width.toString(),
      grammage.toString(),
      status.toString(),
      statusName,
    ];
  }
}
