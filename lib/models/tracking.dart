import 'package:tdms_flutter/core/utils/constants.dart';

class Tracking {
  int id;
  int idOrderDetail;
  String fromStationName;
  String toStationName;
  num dyeingWeight;
  int boltCount;
  int gathFabricW;
  int gathFabricC;
  int status;
  String notes;
  int machineNo;
  String? worker1;
  String? worker2;
  String sendByUser;
  DateTime? arriveDate;
  DateTime? startDate;
  DateTime? completedDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tracking({
    required this.id,
    required this.idOrderDetail,
    required this.fromStationName,
    required this.toStationName,
    required this.dyeingWeight,
    required this.boltCount,
    required this.gathFabricW,
    required this.gathFabricC,
    required this.status,
    required this.notes,
    required this.machineNo,
    required this.worker1,
    required this.worker2,
    required this.sendByUser,
    required this.arriveDate,
    required this.startDate,
    required this.completedDate,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Tracking.fromJson(Map<String, dynamic> json) {
    return Tracking(
      id: json["id"],
      idOrderDetail: json["id_order_detail"],
      fromStationName: json["from_station_name"],
      toStationName: json["to_station_name"],
      dyeingWeight: json["dyeing_weight"],
      boltCount: json["bolt_count"],
      gathFabricW: json["gath_fabric_w"],
      gathFabricC: json["gath_fabric_c"],
      status: json["status"],
      notes: json["notes"],
      machineNo: json["machine_no"],
      worker1: json["worker1"],
      worker2: json["worker2"],
      sendByUser: json["send_by_user"],
      arriveDate: DateTime.tryParse(json["arrive_date"] ?? ""),
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      completedDate: DateTime.tryParse(json["completed_date"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  static final List<String> tableHeaders = [
    'رقم التتبع',
    'رقم تفاصيل الطلب',
    'من محطة',
    'إلى محطة',
    'وزن الصباغة',
    'عدد الطبات',
    'عرض القماش المجمع',
    'عدد القماش المجمع',
    'الحالة',
    'ملاحظات',
    'رقم الماكينة',
    'العامل 1',
    'العامل 2',
    'تم الإرسال بواسطة',
    'تاريخ الوصول',
    'تاريخ البدء',
    'تاريخ الانتهاء',
    'تاريخ الإنشاء',
    'آخر تحديث',
  ];
  List<String> toTableRow() {
    return [
      id.toString(),
      idOrderDetail.toString(),
      fromStationName,
      toStationName,
      dyeingWeight.toString(),
      boltCount.toString(),
      gathFabricW.toString(),
      gathFabricC.toString(),
      status.toString(),
      notes,
      machineNo.toString(),
      worker1 != null ? worker1! : '—',
      worker2 != null ? worker2! : '—',
      sendByUser,
      arriveDate != null ? arriveDate!.formateDate : '—',
      startDate != null ? startDate!.formateDate : '—',
      completedDate != null ? completedDate!.formateDate : '—',
      createdAt != null ? createdAt!.formateDate : '—',
      updatedAt != null ? updatedAt!.formateDate : '—',
    ];
  }
}
