import 'tracking.dart';

class OrderDetail {
  final int id;
  final int orderId;
  final String theColor;
  final int colorNo;
  final double dyeingWeight;
  final int boltCount;
  final double remainingWeight;
  final int remainingBolt;
  final double gathFabricW;
  final num gathFabricC;
  final double remainingGathW;
  final num remainingGathC;
  final int invId;
  final double dyeingWidth;
  final double dyeingStretch;
  final int finishWork;
  final int status;
  final int movementQty;
  final List<Tracking> tracking;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.theColor,
    required this.colorNo,
    required this.dyeingWeight,
    required this.boltCount,
    required this.remainingWeight,
    required this.remainingBolt,
    required this.gathFabricW,
    required this.gathFabricC,
    required this.remainingGathW,
    required this.remainingGathC,
    required this.invId,
    required this.dyeingWidth,
    required this.dyeingStretch,
    required this.finishWork,
    required this.status,
    required this.movementQty,
    required this.tracking,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json["id"],
      orderId: json["order_id"],
      theColor: json["the_color"],
      colorNo: json["color_no"],
      dyeingWeight: (json["dyeing_weight"] as num).toDouble(),
      boltCount: json["bolt_count"],
      remainingWeight: (json["remaining_weight"] as num).toDouble(),
      remainingBolt: json["remaining_bolt"],
      gathFabricW: (json["gath_fabric_w"] as num).toDouble(),
      gathFabricC: (json["gath_fabric_c"] as num).toDouble(),
      remainingGathW: (json["remaining_gath_w"] as num).toDouble(),
      remainingGathC: (json["remaining_gath_c"] as num).toDouble(),
      invId: json["inv_id"],
      dyeingWidth: (json["dyeing_width"] as num).toDouble(),
      dyeingStretch: (json["dyeing_stretch"] as num).toDouble(),
      finishWork: json["finish_work"],
      status: json["status"],
      movementQty: json["movement_qty"],
      tracking: (json["tracking"] as List<dynamic>)
          .map((e) => Tracking.fromJson(e))
          .toList(),
    );
  }

  static const List<String> orderDetailHeaders = [
    "معرف التفاصيل",
    "معرف أمر التوجيه",
    "اسم اللون",
    "رقم اللون",
    "وزن القماش (للصباغة)",
    "عدد الأثواب (للصباغة)",
    "الوزن المتبقي",
    "الأثواب المتبقية",
    "وزن الريب القائم",
    "عدد اثواب الريب (للصباغة)",
    "وزن الريب المتبقي",
    "عدد أثواب الريب المتبقية",
    "معرف الفاتورة",
    "العرض",
    "غراماج",
    "العمل المنجز",
    "الحالة",
    "الكمية المنقولة",
    "عدد التتبع",
  ];

  List<String> toTableRow() {
    return [
      id.toString(),
      orderId.toString(),
      theColor,
      colorNo.toString(),
      dyeingWeight.toString(),
      boltCount.toString(),
      remainingWeight.toString(),
      remainingBolt.toString(),
      gathFabricW.toString(),
      gathFabricC.toString(),
      remainingGathW.toString(),
      remainingGathC.toString(),
      invId.toString(),
      dyeingWidth.toString(),
      dyeingStretch.toString(),
      finishWork.toString(),
      status.toString(),
      movementQty.toString(),
      tracking.length.toString(),
    ];
  }
}
