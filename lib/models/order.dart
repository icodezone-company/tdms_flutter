import 'package:tdms_flutter/core/utils/constants.dart';

import 'order_details.dart';

class Order {
  final int id;
  final int orderNo;
  final DateTime theDate;
  final int invId;
  final int invNo;
  final DateTime invDate;
  final String customerName;
  final String note;
  final String dyeingRelaxing;
  final String dyeingScouring;
  final String dyeingRaising;
  final String dyeingPressing;
  final String dyeingFixation;
  final String dyeingBrushing;
  final String dyeingTshek;
  final String dyeingPrint;
  final String dyeingProcces;
  final String dyeingShaving;
  final String dyeingDyeing;
  final String dyeingOther;
  final int mainInvId;
  final int movementQty;
  final List<OrderDetail> details;

  Order({
    required this.id,
    required this.orderNo,
    required this.theDate,
    required this.invId,
    required this.invNo,
    required this.invDate,
    required this.customerName,
    required this.note,
    required this.dyeingRelaxing,
    required this.dyeingScouring,
    required this.dyeingRaising,
    required this.dyeingPressing,
    required this.dyeingFixation,
    required this.dyeingBrushing,
    required this.dyeingTshek,
    required this.dyeingPrint,
    required this.dyeingProcces,
    required this.dyeingShaving,
    required this.dyeingDyeing,
    required this.dyeingOther,
    required this.mainInvId,
    required this.movementQty,
    required this.details,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      orderNo: json["order_no"],
      theDate: DateTime.parse(json["the_date"]),
      invId: json["inv_id"],
      invNo: json["inv_no"],
      invDate: DateTime.parse(json["inv_date"]),
      customerName: json["cutomer_name"],
      note: json["note"] ?? "",
      dyeingRelaxing: json["dyeing_relaxing"],
      dyeingScouring: json["dyeing_scouring"],
      dyeingRaising: json["dyeing_raising"],
      dyeingPressing: json["dyeing_pressing"],
      dyeingFixation: json["dyeing_fixation"],
      dyeingBrushing: json["dyeing_brushing"],
      dyeingTshek: json["dyeing_tshek"],
      dyeingPrint: json["dyeing_print"],
      dyeingProcces: json["dyeing_procces"],
      dyeingShaving: json["dyeing_shaving"],
      dyeingDyeing: json["dyeing_dyeing"],
      dyeingOther: json["dyeing_other"] ?? "",
      mainInvId: json["main_inv_id"],
      movementQty: json["movement_qty"],
      details: (json["details"] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e))
          .toList(),
    );
  }

  static const List<String> orderHeaders = [
    "معرف التوجيه",
    "رقم أمر التوجيه",
    "تاريخ التوجيه",
    "معرف الفاتورة",
    "رقم الفاتورة",
    "تاريخ الفاتورة",
    "اسم الزبون",
    "ملاحظات",
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
    "معرف الفاتورة الرئيسية",
    "الكمية المنقولة",
    "عدد التفاصيل",
  ];

  List<String> toTableRow() {
    String yesNo(String v) => v == "1" ? "نعم" : "لا";
    return [
      id.toString(),
      orderNo.toString(),
      theDate.formateDate,
      invId.toString(),
      invNo.toString(),
      invDate.formateDate,
      customerName,
      note,
      yesNo(dyeingRelaxing),
      yesNo(dyeingScouring),
      yesNo(dyeingRaising),
      yesNo(dyeingPressing),
      yesNo(dyeingFixation),
      yesNo(dyeingBrushing),
      yesNo(dyeingTshek),
      yesNo(dyeingPrint),
      yesNo(dyeingProcces),
      yesNo(dyeingShaving),
      yesNo(dyeingDyeing),
      dyeingOther,
      mainInvId.toString(),
      movementQty.toString(),
      details.length.toString(),
    ];
  }
}
