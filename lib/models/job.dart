import 'package:tdms_flutter/models/tracking.dart';

class Job {
  int id;
  int orderId;
  String theColor;
  int colorNo;
  int dyeingWeight;
  int boltCount;
  int remainingWeight;
  int remainingBolt;
  int gathFabricW;
  int gathFabricC;
  int remainingGathW;
  int remainingGathC;
  int invId;
  int dyeingWidth;
  int dyeingStretch;
  int finishWork;
  int status;
  int movementQty;
  List<Tracking> tracking;

  Job({
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
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json["id"],
      orderId: json["order_id"],
      theColor: json["the_color"],
      colorNo: json["color_no"],
      dyeingWeight: json["dyeing_weight"],
      boltCount: json["bolt_count"],
      remainingWeight: json["remaining_weight"],
      remainingBolt: json["remaining_bolt"],
      gathFabricW: json["gath_fabric_w"],
      gathFabricC: json["gath_fabric_c"],
      remainingGathW: json["remaining_gath_w"],
      remainingGathC: json["remaining_gath_c"],
      invId: json["inv_id"],
      dyeingWidth: json["dyeing_width"],
      dyeingStretch: json["dyeing_stretch"],
      finishWork: json["finish_work"],
      status: json["status"],
      movementQty: json["movement_qty"],
      tracking: json["tracking"] == null
          ? []
          : List<Tracking>.from(
              json["tracking"].map((x) => Tracking.fromJson(x)),
            ),
    );
  }
  static final List<String> tableHeaders = [
    'رقم الوظيفة',
    'رقم الطلب',
    'اللون',
    'رقم اللون',
    'وزن الصباغة',
    'عدد الطبات',
    'الوزن المتبقي',
    'الطبات المتبقية',
    'عرض القماش',
    'عدد القماش',
    'الوزن المتبقي للقماش',
    'عدد القماش المتبقي',
    'رقم المخزن',
    'عرض الصباغة',
    'تمدد الصباغة',
    'إنهاء العمل',
    'الحالة',
    'كمية الحركة',
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
    ];
  }
}
