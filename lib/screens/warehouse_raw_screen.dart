import 'package:flutter/material.dart';

import 'invoice_tab.dart';
import 'order_tab.dart';
import 'summary_tab.dart';
import 'total_data_tab.dart';

class WarehouseRawScreen extends StatefulWidget {
  const WarehouseRawScreen({super.key});

  @override
  State<WarehouseRawScreen> createState() => _WarehouseRawScreenState();
}

class _WarehouseRawScreenState extends State<WarehouseRawScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("مستودع المواد الخام"),
          bottom: const TabBar(
            // isScrollable: true,
            labelColor: Colors.white, // Selected tab text
            unselectedLabelColor: Colors.white70,
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(text: "الفواتير"),
              Tab(text: "التوجيه"),
              Tab(text: "إجمالي البيانات"),
              Tab(text: "الخلاصة"),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [InvoiceTab(), OrderTab(), TotalDataTab(), SummaryTab()],
        ),
      ),
    );
  }
}
