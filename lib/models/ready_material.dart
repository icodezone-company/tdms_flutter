import 'package:tdms_flutter/core/utils/constants.dart';

class ReadyMaterial {
  final int invoiceId;
  final int invoiceNo;
  final DateTime invoiceDate;
  final String customerName;
  final int customerInvoiceNo;
  final DateTime customerInvoiceDate;
  final String invoiceNotes;

  final int invDetailId;
  final String fabricSource;
  final String fabricCategory;
  final String fabricType;

  final int baseFabricWeight;
  final int baseBoltCount;

  final int receivedRibWeight;
  final int receivedRibBoltCount;

  final int orderId;
  final int routingOrderNo;
  final DateTime routingOrderDate;
  final String routingNotes;

  final String colorName;
  final int colorNo;

  final int activeDyeingWeight;
  final int activeDyeingBoltCount;

  final int remainingWeight;
  final int remainingBoltCount;

  final int activeRibWeight;
  final int activeRibBoltCount;

  final int remainingRibWeight;
  final int remainingRibBoltCount;

  final bool softening;
  final bool washing;
  final bool fluffing;
  final bool ironing;
  final bool fixing;
  final bool sanding;
  final bool polishing;
  final bool printing;
  final bool treatment;
  final bool shaving;
  final bool dyeing;

  final String other;
  final int width;
  final int gramWeight;
  final String orderStatus;

  final int mainDyeingInvoiceNo;

  ReadyMaterial({
    required this.invoiceId,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.customerName,
    required this.customerInvoiceNo,
    required this.customerInvoiceDate,
    required this.invoiceNotes,
    required this.invDetailId,
    required this.fabricSource,
    required this.fabricCategory,
    required this.fabricType,
    required this.baseFabricWeight,
    required this.baseBoltCount,
    required this.receivedRibWeight,
    required this.receivedRibBoltCount,
    required this.orderId,
    required this.routingOrderNo,
    required this.routingOrderDate,
    required this.routingNotes,
    required this.colorName,
    required this.colorNo,
    required this.activeDyeingWeight,
    required this.activeDyeingBoltCount,
    required this.remainingWeight,
    required this.remainingBoltCount,
    required this.activeRibWeight,
    required this.activeRibBoltCount,
    required this.remainingRibWeight,
    required this.remainingRibBoltCount,
    required this.softening,
    required this.washing,
    required this.fluffing,
    required this.ironing,
    required this.fixing,
    required this.sanding,
    required this.polishing,
    required this.printing,
    required this.treatment,
    required this.shaving,
    required this.dyeing,
    required this.other,
    required this.width,
    required this.gramWeight,
    required this.orderStatus,
    required this.mainDyeingInvoiceNo,
  });

  factory ReadyMaterial.fromJson(Map<String, dynamic> json) {
    bool yesNo(dynamic v) => v == "نعم";
    return ReadyMaterial(
      invoiceId: json["معرف الفاتورة"],
      invoiceNo: json["رقم فاتورة"],
      invoiceDate: DateTime.parse(json["تاريخ الفاتورة"]),
      customerName: json["اسم الزبون"],
      customerInvoiceNo: json["رقم فاتورة الزبون"],
      customerInvoiceDate: DateTime.parse(json["تاريخ فاتورة الزبون"]),
      invoiceNotes: json["ملاحظات الفاتورة"],

      invDetailId: json["id_inv_detail"],
      fabricSource: json["مصدر القماش"],
      fabricCategory: json["زمرة القماش"],
      fabricType: json["نوع القماش"],

      baseFabricWeight: json["وزن القماش الأساسي"],
      baseBoltCount: json["عدد الأثواب الأساسي"],

      receivedRibWeight: json["وزن الريب المستلم"],
      receivedRibBoltCount: json["عدد أثواب الريب المستلم"],

      orderId: json["id"],
      routingOrderNo: json["رقم أمر التوجيه"],
      routingOrderDate: DateTime.parse(json["تاريخ أمر التوجيه"]),
      routingNotes: json["ملاحظات التوجيه"],

      colorName: json["اسم اللون"],
      colorNo: json["رقم اللون"],

      activeDyeingWeight: json["الوزن القائم (للصباغة)"],
      activeDyeingBoltCount: json["عدد الأثواب (للصباغة)"],

      remainingWeight: json["الوزن المتبقي"],
      remainingBoltCount: json["الأثواب المتبقية"],

      activeRibWeight: json["وزن الريب القائم"],
      activeRibBoltCount: json["عدد اثواب الريب (للصباغة)"],

      remainingRibWeight: json["وزن الريب المتبقي"],
      remainingRibBoltCount: json["عدد أثواب الريب المتبقية"],

      softening: yesNo(json["تطرية"]),
      washing: yesNo(json["غسيل"]),
      fluffing: yesNo(json["نفش"]),
      ironing: yesNo(json["كوي"]),
      fixing: yesNo(json["تثبيت"]),
      sanding: yesNo(json["سنفرة"]),
      polishing: yesNo(json["تلميع"]),
      printing: yesNo(json["طباعة"]),
      treatment: yesNo(json["معالجة"]),
      shaving: yesNo(json["حلاقة"]),
      dyeing: yesNo(json["صباغة"]),

      other: json["شيء آخر"],
      width: json["العرض"],
      gramWeight: json["غراماج"],
      orderStatus: json["حالة الطلب"],
      mainDyeingInvoiceNo: json["رقم فاتورة الدباغة الرئيسية"],
    );
  }
  static const List<String> readyMaterialHeaders = [
    "معرف الفاتورة",
    "رقم فاتورة",
    "تاريخ الفاتورة",
    "اسم الزبون",
    "رقم فاتورة الزبون",
    "تاريخ فاتورة الزبون",
    "ملاحظات الفاتورة",
    "id_inv_detail",
    "مصدر القماش",
    "زمرة القماش",
    "نوع القماش",
    "وزن القماش الأساسي",
    "عدد الأثواب الأساسي",
    "وزن الريب المستلم",
    "عدد أثواب الريب المستلم",
    "id",
    "رقم أمر التوجيه",
    "تاريخ أمر التوجيه",
    "ملاحظات التوجيه",
    "اسم اللون",
    "رقم اللون",
    "الوزن القائم (للصباغة)",
    "عدد الأثواب (للصباغة)",
    "الوزن المتبقي",
    "الأثواب المتبقية",
    "وزن الريب القائم",
    "عدد اثواب الريب (للصباغة)",
    "وزن الريب المتبقي",
    "عدد أثواب الريب المتبقية",
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
    "شيء آخر",
    "العرض",
    "غراماج",
    "حالة الطلب",
    "رقم فاتورة الدباغة الرئيسية",
  ];

  List<String> toTableRow() {
    return [
      invoiceId.toString(),
      invoiceNo.toString(),
      invoiceDate.formateDate,
      customerName,
      customerInvoiceNo.toString(),
      customerInvoiceDate.formateDate,
      invoiceNotes,
      invDetailId.toString(),
      fabricSource,
      fabricCategory,
      fabricType,
      baseFabricWeight.toString(),
      baseBoltCount.toString(),
      receivedRibWeight.toString(),
      receivedRibBoltCount.toString(),
      orderId.toString(),
      routingOrderNo.toString(),
      routingOrderDate.formateDate,
      routingNotes,
      colorName,
      colorNo.toString(),
      activeDyeingWeight.toString(),
      activeDyeingBoltCount.toString(),
      remainingWeight.toString(),
      remainingBoltCount.toString(),
      activeRibWeight.toString(),
      activeRibBoltCount.toString(),
      remainingRibWeight.toString(),
      remainingRibBoltCount.toString(),
      softening ? "نعم" : "لا",
      washing ? "نعم" : "لا",
      fluffing ? "نعم" : "لا",
      ironing ? "نعم" : "لا",
      fixing ? "نعم" : "لا",
      sanding ? "نعم" : "لا",
      polishing ? "نعم" : "لا",
      printing ? "نعم" : "لا",
      treatment ? "نعم" : "لا",
      shaving ? "نعم" : "لا",
      dyeing ? "نعم" : "لا",
      other,
      width.toString(),
      gramWeight.toString(),
      orderStatus,
      mainDyeingInvoiceNo.toString(),
    ];
  }
}
