import 'package:flutter/material.dart';

import '../../models/invoice.dart';
import '../../models/invoice_details.dart';
import '../../models/job.dart';
import '../../models/order.dart';
import '../../models/order_details.dart';
import '../../models/ready_material.dart';
import '../../models/summary_model.dart';
import '../../models/total_data.dart';
import '../../models/tracking.dart';

class Constants {
  const Constants._();

  // Api
  static const String baseUrl = "https://tdms.mahmoudbannan.com";
  static const String login = "$baseUrl/api/login";
  static const String getJobs = "$baseUrl/api/get_jobs";
  static const String startWork = "$baseUrl/api/start_work";
  static const String sendTo = "$baseUrl/api/send_to";
  static const String warehouseMaterialReport =
      "$baseUrl/api/warehouse_material_report";
  static const String getInvoices = "$baseUrl/api/get_invoices";
  static const String getDyeingOrderInvoice =
      "$baseUrl/api/get_dyeing_order_invoices";
  static const String getAllData = "$baseUrl/api/get_all_data";
  static const String getSummary = "$baseUrl/api/get_summary";
  static const String getReadyMaterialReport =
      "$baseUrl/api/get_ready_material_report";

  // Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // Keys
  static const String loginKey = "LOGIN_KEY";
  static const String userKey = "USER_KEY";

  static final List<Tracking> fakeTrackingList = [
    Tracking(
      id: 1,
      idOrderDetail: 1001,
      fromStationName: 'الرام',
      toStationName: 'المصبغة',
      dyeingWeight: 250,
      boltCount: 12,
      gathFabricW: 180,
      gathFabricC: 24,
      status: 1,
      notes: 'جاهز للصباغة',
      machineNo: 3,
      worker1: 'أحمد',
      worker2: 'محمد',
      sendByUser: 'admin',
      arriveDate: DateTime(2025, 1, 5, 8, 30),
      startDate: DateTime(2025, 1, 5, 9, 0),
      completedDate: null,
      createdAt: DateTime(2025, 1, 5, 8, 0),
      updatedAt: null,
    ),
    Tracking(
      id: 2,
      idOrderDetail: 1002,
      fromStationName: 'المصبغة',
      toStationName: 'السنفرة',
      dyeingWeight: 300,
      boltCount: 15,
      gathFabricW: 190,
      gathFabricC: 30,
      status: 2,
      notes: 'تحت التشغيل',
      machineNo: 5,
      worker1: 'خالد',
      worker2: 'سعيد',
      sendByUser: 'supervisor',
      arriveDate: DateTime(2025, 1, 6, 10, 0),
      startDate: DateTime(2025, 1, 6, 10, 30),
      completedDate: null,
      createdAt: DateTime(2025, 1, 6, 9, 45),
      updatedAt: null,
    ),
    Tracking(
      id: 3,
      idOrderDetail: 1003,
      fromStationName: 'السنفرة',
      toStationName: 'المعالجة',
      dyeingWeight: 220,
      boltCount: 10,
      gathFabricW: 175,
      gathFabricC: 20,
      status: 3,
      notes: 'بانتظار النقل',
      machineNo: 2,
      worker1: 'يوسف',
      worker2: 'حسين',
      sendByUser: 'operator',
      arriveDate: DateTime(2025, 1, 7, 11, 15),
      startDate: DateTime(2025, 1, 7, 11, 45),
      completedDate: DateTime(2025, 1, 7, 14, 0),
      createdAt: DateTime(2025, 1, 7, 11, 0),
      updatedAt: DateTime(2025, 1, 7, 14, 10),
    ),
    Tracking(
      id: 4,
      idOrderDetail: 1004,
      fromStationName: 'المعالجة',
      toStationName: 'النفش',
      dyeingWeight: 280,
      boltCount: 14,
      gathFabricW: 185,
      gathFabricC: 28,
      status: 4,
      notes: 'مكتمل',
      machineNo: 7,
      worker1: 'علي',
      worker2: 'محمود',
      sendByUser: 'admin',
      arriveDate: DateTime(2025, 1, 8, 8, 0),
      startDate: DateTime(2025, 1, 8, 8, 30),
      completedDate: DateTime(2025, 1, 8, 12, 45),
      createdAt: DateTime(2025, 1, 8, 7, 45),
      updatedAt: DateTime(2025, 1, 8, 13, 0),
    ),
  ];
  static final List<Job> jobList = [
    Job(
      id: 1,
      orderId: 1001,
      theColor: 'أحمر',
      colorNo: 5,
      dyeingWeight: 250,
      boltCount: 12,
      remainingWeight: 50,
      remainingBolt: 2,
      gathFabricW: 180,
      gathFabricC: 24,
      remainingGathW: 30,
      remainingGathC: 4,
      invId: 101,
      dyeingWidth: 150,
      dyeingStretch: 5,
      finishWork: 0,
      status: 1,
      movementQty: 0,
      tracking: fakeTrackingList,
    ),
    Job(
      id: 2,
      orderId: 1002,
      theColor: 'أزرق',
      colorNo: 8,
      dyeingWeight: 300,
      boltCount: 15,
      remainingWeight: 100,
      remainingBolt: 5,
      gathFabricW: 190,
      gathFabricC: 30,
      remainingGathW: 50,
      remainingGathC: 6,
      invId: 102,
      dyeingWidth: 160,
      dyeingStretch: 6,
      finishWork: 1,
      status: 2,
      movementQty: 3,
      tracking: fakeTrackingList,
    ),
  ];

  static final List<ReadyMaterial> fakeReadyMaterials = List.generate(5, (
    index,
  ) {
    return ReadyMaterial(
      invoiceId: 10 + index,
      invoiceNo: 1000 + index,
      invoiceDate: DateTime(2025, 12, 10).add(Duration(days: index)),
      customerName: "زبون ${index + 1}",
      customerInvoiceNo: 500 + index,
      customerInvoiceDate: DateTime(2025, 12, 10).add(Duration(days: index)),
      invoiceNotes: "ملاحظات فاتورة ${index + 1}",

      invDetailId: 15 + index,
      fabricSource: "حلب",
      fabricCategory: "قطن ممزوج",
      fabricType: "فليس قطن",

      baseFabricWeight: 1000 + (index * 100),
      baseBoltCount: 100 + (index * 10),

      receivedRibWeight: 200 + (index * 20),
      receivedRibBoltCount: 20 + index,

      orderId: 16 + index,
      routingOrderNo: 1 + index,
      routingOrderDate: DateTime(2025, 12, 10).add(Duration(days: index)),
      routingNotes: "ريب كيس ${index + 1}",

      colorName: ["أصفر", "أحمر", "أزرق", "أخضر", "برتقالي"][index % 5],
      colorNo: 9000 + index,

      activeDyeingWeight: 250 + (index * 10),
      activeDyeingBoltCount: 25 + index,

      remainingWeight: 1250 + (index * 10),
      remainingBoltCount: 125 + index,

      activeRibWeight: 500 + (index * 20),
      activeRibBoltCount: 50 + index,

      remainingRibWeight: 470 + (index * 15),
      remainingRibBoltCount: 47 + index,

      softening: index % 2 == 0,
      washing: index % 2 == 1,
      fluffing: true,
      ironing: index % 2 == 0,
      fixing: false,
      sanding: false,
      polishing: false,
      printing: false,
      treatment: false,
      shaving: false,
      dyeing: true,

      other: "",
      width: 180,
      gramWeight: 180,
      orderStatus: [
        "مستودع الجاهز",
        "مصبغة",
        "المطبعة",
        "السنفرة",
        "نفش",
      ][index % 5],

      mainDyeingInvoiceNo: 12 + index,
    );
  });

  static final List<Invoice> fakeInvoices = List.generate(5, (index) {
    return Invoice(
      id: 100 + index,
      lotNo: 200 + index,
      lotDate: DateTime(2025, 12, 10).add(Duration(days: index)),
      customerName: "زبون ${index + 1}",
      invNo: 500 + index,
      invDate: DateTime(2025, 12, 10).add(Duration(days: index)),
      note: "ملاحظات الفاتورة رقم ${500 + index}",
      details: List.generate(2 + (index % 2), (dIndex) {
        return InvoiceDetail(
          id: 1000 + index * 10 + dIndex,
          invId: 100 + index,
          fabricSource: ["حلب", "دمشق", "اللاذقية"][dIndex % 3],
          fabricType: ["قطن ممزوج", "قطن", "فليس قطن"][dIndex % 3],
          fabricWeight: 1000 + (index * 100) + dIndex * 50,
          boltCount: 100 + (index * 10) + dIndex * 5,
          gathFabricW: 500 - (dIndex * 50),
          gathFabricC: 50 - (dIndex * 5),
          fabricKind: ["فليس قطن", "سنكل قطن", "قطن خالص"][dIndex % 3],
        );
      }),
    );
  });
  static final List<Order> fakeOrders = List.generate(5, (orderIndex) {
    return Order(
      id: 100 + orderIndex,
      orderNo: 200 + orderIndex,
      theDate: DateTime(2025, 12, 10).add(Duration(days: orderIndex)),
      invId: 500 + orderIndex,
      invNo: 600 + orderIndex,
      invDate: DateTime(2025, 12, 10).add(Duration(days: orderIndex)),
      customerName: "زبون ${orderIndex + 1}",
      note: "ملاحظات التوجيه ${orderIndex + 1}",
      dyeingRelaxing: "1",
      dyeingScouring: "1",
      dyeingRaising: orderIndex % 2 == 0 ? "1" : "0",
      dyeingPressing: "1",
      dyeingFixation: "0",
      dyeingBrushing: "0",
      dyeingTshek: "0",
      dyeingPrint: "0",
      dyeingProcces: "0",
      dyeingShaving: "0",
      dyeingDyeing: "1",
      dyeingOther: "",
      mainInvId: 100 + orderIndex,
      movementQty: 0,
      details: List.generate(1 + (orderIndex % 2), (detailIndex) {
        return OrderDetail(
          id: 1000 + orderIndex * 10 + detailIndex,
          orderId: 100 + orderIndex,
          theColor: ["أحمر", "أخضر", "أزرق"][detailIndex % 3],
          colorNo: 9990 + detailIndex,
          dyeingWeight: 300 + orderIndex * 50 + detailIndex * 10,
          boltCount: 30 + orderIndex * 5 + detailIndex * 2,
          remainingWeight: 1500 - orderIndex * 20,
          remainingBolt: 150 - orderIndex * 2,
          gathFabricW: 30 + detailIndex * 5,
          gathFabricC: 3 + detailIndex,
          remainingGathW: 270 - detailIndex * 10,
          remainingGathC: 27 - detailIndex,
          invId: 500 + orderIndex,
          dyeingWidth: 180,
          dyeingStretch: 210,
          finishWork: 0,
          status: orderIndex % 3,
          movementQty: 0,
          tracking: List.generate(2 + (detailIndex % 2), (trackIndex) {
            return Tracking(
              id: 10000 + orderIndex * 100 + detailIndex * 10 + trackIndex,
              idOrderDetail: 1000 + orderIndex * 10 + detailIndex,
              fromStationName: ["التوجيه", "التفتيح", "صباغة"][trackIndex % 3],
              toStationName: ["التفتيح", "جت", "Spreading"][trackIndex % 3],
              dyeingWeight: 300.0 - trackIndex * 50,
              boltCount: 30 - trackIndex * 5,
              gathFabricW: 30 - trackIndex * 2,
              gathFabricC: 3 - trackIndex,
              status: trackIndex % 4,
              notes: trackIndex == 0 ? "ريب كيس" : "Ready for next step",
              machineNo: 1,
              worker1: trackIndex % 2 == 0 ? "احمد" : null,
              worker2: trackIndex % 2 == 0 ? "محمد" : null,
              sendByUser: "اب ربيع",
              arriveDate: DateTime(2025, 12, 10),
              startDate: DateTime(2025, 12, 10),
              completedDate: trackIndex == 0 ? DateTime(2025, 12, 11) : null,
              createdAt: DateTime(2025, 12, 9, 21, 0, 0),
              updatedAt: null,
            );
          }),
        );
      }),
    );
  });

  static final List<TotalData> fakeTotalData = [
    TotalData(
      invoiceId: 12,
      customerInvoiceNo: 1,
      customerInvoiceDate: DateTime(2025, 12, 10),
      customerName: "زبون",
      invoiceNo: 1,
      invoiceDate: DateTime(2025, 12, 10),
      invoiceNote: "ملاحظات الفاتورة الأولى",

      invDetailId: 15,
      fabricSource: "حلب",
      fabricGroup: "قطن ممزوج",
      fabricType: "فليس قطن",
      baseWeight: 1500,
      fabricBoltCount: 150,
      receivedRibWeight: 500,
      receivedRibBoltCount: 50,

      dyeingOrderId: 16,
      orderNo: 1,
      orderDate: DateTime(2025, 12, 10),
      orderNote: "ريب كيس",

      relaxing: "نعم",
      scouring: "نعم",
      raising: "نعم",
      pressing: "نعم",
      fixation: "لا",
      brushing: "لا",
      tshek: "لا",
      print: "لا",
      process: "لا",
      shaving: "لا",
      dyeing: "نعم",
      other: "",

      orderMovementQty: 0,

      orderDetailId: 16,
      colorName: "اصفر",
      colorNo: 9999,
      currentWeight: 250,
      currentBoltCount: 25,
      remainingWeight: 1250,
      remainingBoltCount: 125,
      currentRibWeight: 30,
      usedRibBoltCount: 3,
      remainingRibWeight: 470,
      remainingRibBoltCount: 47,

      width: 180,
      grammage: 180,
      status: 8,
      statusName: "مستودع الجاهز",
    ),

    TotalData(
      invoiceId: 12,
      customerInvoiceNo: 1,
      customerInvoiceDate: DateTime(2025, 12, 10),
      customerName: "زبون",
      invoiceNo: 1,
      invoiceDate: DateTime(2025, 12, 10),
      invoiceNote: "ملاحظات الفاتورة الثانية",

      invDetailId: 16,
      fabricSource: "دمشق",
      fabricGroup: "قطن",
      fabricType: "سنكل قطن",
      baseWeight: 1800,
      fabricBoltCount: 180,
      receivedRibWeight: 300,
      receivedRibBoltCount: 30,

      dyeingOrderId: 17,
      orderNo: 2,
      orderDate: DateTime(2025, 12, 10),
      orderNote: "ريب كيس",

      relaxing: "نعم",
      scouring: "نعم",
      raising: "لا",
      pressing: "نعم",
      fixation: "نعم",
      brushing: "لا",
      tshek: "لا",
      print: "لا",
      process: "لا",
      shaving: "لا",
      dyeing: "نعم",
      other: "",

      orderMovementQty: 0,

      orderDetailId: 17,
      colorName: "اخضر",
      colorNo: 9991,
      currentWeight: 300,
      currentBoltCount: 30,
      remainingWeight: 1500,
      remainingBoltCount: 150,
      currentRibWeight: 30,
      usedRibBoltCount: 3,
      remainingRibWeight: 270,
      remainingRibBoltCount: 27,

      width: 180,
      grammage: 210,
      status: 6,
      statusName: "الجت",
    ),

    TotalData(
      invoiceId: 13,
      customerInvoiceNo: 2,
      customerInvoiceDate: DateTime(2025, 12, 12),
      customerName: "زبون صناعي",
      invoiceNo: 2,
      invoiceDate: DateTime(2025, 12, 12),
      invoiceNote: "دفعة خاصة",

      invDetailId: 18,
      fabricSource: "اللاذقية",
      fabricGroup: "قطن خالص",
      fabricType: "فليس ثقيل",
      baseWeight: 2000,
      fabricBoltCount: 200,
      receivedRibWeight: 600,
      receivedRibBoltCount: 60,

      dyeingOrderId: 18,
      orderNo: 3,
      orderDate: DateTime(2025, 12, 12),
      orderNote: "تشغيل عاجل",

      relaxing: "لا",
      scouring: "نعم",
      raising: "نعم",
      pressing: "لا",
      fixation: "نعم",
      brushing: "نعم",
      tshek: "لا",
      print: "لا",
      process: "نعم",
      shaving: "لا",
      dyeing: "نعم",
      other: "طلب خاص",

      orderMovementQty: 5,

      orderDetailId: 18,
      colorName: "أزرق",
      colorNo: 8888,
      currentWeight: 400,
      currentBoltCount: 40,
      remainingWeight: 1600,
      remainingBoltCount: 160,
      currentRibWeight: 40,
      usedRibBoltCount: 4,
      remainingRibWeight: 560,
      remainingRibBoltCount: 56,

      width: 190,
      grammage: 220,
      status: 4,
      statusName: "المعالجة",
    ),
  ];
  static final List<SummaryModel> fakeSummaryData = [
    SummaryModel(
      invoiceNo: 1,
      invoiceDate: DateTime(2025, 12, 10),
      customerName: "زبون",
      fabricSource: "حلب",
      fabricGroup: "قطن ممزوج",
      baseWeight: 1500,
      fabricBoltCount: 150,
      receivedRibWeight: 500,
      receivedRibBoltCount: 50,
      totalCurrentWeight: 250,
      totalCurrentBoltCount: 25,
      totalRibWeight: 30,
      totalRibBoltCount: 3,
      remainingFabricWeight: 1250,
      remainingFabricBoltCount: 125,
      remainingRibWeight: 470,
      remainingRibBoltCount: 47,
    ),
    SummaryModel(
      invoiceNo: 1,
      invoiceDate: DateTime(2025, 12, 10),
      customerName: "زبون",
      fabricSource: "دمشق",
      fabricGroup: "قطن",
      baseWeight: 1800,
      fabricBoltCount: 180,
      receivedRibWeight: 300,
      receivedRibBoltCount: 30,
      totalCurrentWeight: 300,
      totalCurrentBoltCount: 30,
      totalRibWeight: 30,
      totalRibBoltCount: 3,
      remainingFabricWeight: 1500,
      remainingFabricBoltCount: 150,
      remainingRibWeight: 270,
      remainingRibBoltCount: 27,
    ),
  ];

  static const List<String> dyeingTitles = [
    "الرام",
    "المطبعة",
    "السنفرة",
    "المعالجة",
    "نفش",
    "جت",
    "تفتيح",
    "مستودع المواد الجاهزة",
  ];

  static const List<IconData> dyeingIcons = [
    Icons.settings,
    Icons.color_lens_outlined,
    Icons.grain,
    Icons.science_outlined,
    Icons.blur_on,
  ];

  static final Map<int, String> dyeingById = {
    for (int i = 0; i < dyeingTitles.length; i++) i + 1: dyeingTitles[i],
  };

  static final Map<String, int> dyeingByName = {
    for (int i = 0; i < dyeingTitles.length; i++) dyeingTitles[i]: i + 1,
  };
}

extension FormatDate on DateTime {
  String get formateDate =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  String get formateDateReverse =>
      '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
}
