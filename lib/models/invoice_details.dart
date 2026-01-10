class InvoiceDetail {
  final int id;
  final int invId;
  final String fabricSource;
  final String fabricType;
  final int fabricWeight;
  final int boltCount;
  final int gathFabricW;
  final int gathFabricC;
  final String fabricKind;

  InvoiceDetail({
    required this.id,
    required this.invId,
    required this.fabricSource,
    required this.fabricType,
    required this.fabricWeight,
    required this.boltCount,
    required this.gathFabricW,
    required this.gathFabricC,
    required this.fabricKind,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) {
    return InvoiceDetail(
      id: json["id"],
      invId: json["inv_id"],
      fabricSource: json["fabric_source"],
      fabricType: json["fabric_type"],
      fabricWeight: json["fabric_weight"],
      boltCount: json["bolt_count"],
      gathFabricW: json["gath_fabric_w"],
      gathFabricC: json["gath_fabric_c"],
      fabricKind: json["fabric_kind"],
    );
  }
  static const List<String> invoiceDetailHeaders = [
    "معرف التفاصيل", // id
    "معرف الفاتورة", // inv_id
    "مصدر القماش", // fabric_source
    "نوع القماش", // fabric_type
    "وزن القماش", // fabric_weight
    "عدد الأثواب", // bolt_count
    "وزن الأثواب المستلمة", // gath_fabric_w
    "عدد الأثواب المستلمة", // gath_fabric_c
    "نوع القماش الخاص", // fabric_kind
  ];

  List<String> toTableRow() {
    return [
      id.toString(),
      invId.toString(),
      fabricSource,
      fabricType,
      fabricWeight.toString(),
      boltCount.toString(),
      gathFabricW.toString(),
      gathFabricC.toString(),
      fabricKind,
    ];
  }
}
