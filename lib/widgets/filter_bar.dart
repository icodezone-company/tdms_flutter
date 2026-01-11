import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tdms_flutter/core/utils/constants.dart';

import '../core/utils/strings.dart';
import '../models/customer.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    super.key,
    required this.isLoading,
    required this.fromDate,
    required this.toDate,
    required this.customerName,
    required this.onChanged,
  });
  final bool isLoading;
  final DateTime fromDate;
  final DateTime toDate;
  final String customerName;
  final void Function(String customerName, DateTime fromDate, DateTime toDate)
  onChanged;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  late DateTime fromDate;
  late DateTime toDate;
  late String customerName;
  late Future<List<String>> _future;

  @override
  void initState() {
    fromDate = widget.fromDate;
    toDate = widget.toDate;
    customerName = widget.customerName;
    _future = getAllCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // From Date
              Expanded(
                child: TextField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  readOnly: true,
                  controller: TextEditingController(text: fromDate.formateDate),
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: fromDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate == null) return;
                    fromDate = pickedDate;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: "من تاريخ",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  readOnly: true,
                  controller: TextEditingController(text: toDate.formateDate),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: toDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate == null) return;
                    toDate = pickedDate;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: "إلى تاريخ",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (snapshot.hasError)
                      return Center(
                        child: IconButton(
                          onPressed: () {
                            _future = getAllCustomers();
                            setState(() {});
                          },
                          icon: Icon(Icons.replay),
                        ),
                      );
                    if (snapshot.hasData)
                      return DropdownButtonFormField<String>(
                        initialValue: widget.customerName,
                        items: ["الكل", ...snapshot.data!]
                            .map(
                              (c) => DropdownMenuItem<String>(
                                value: c == "الكل" ? "" : c,
                                child: Text(c),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          customerName = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "الزبون",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                      );
                    return SizedBox();
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(24)),
                  ),
                ),
                onPressed: widget.isLoading
                    ? null
                    : () {
                        widget.onChanged(customerName, fromDate, toDate);
                      },
                child: const Text("فلتر"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<String>> getAllCustomers() async {
    try {
      Response res = await GetIt.I<Client>().get(
        Uri.parse(Constants.getCustomers),
      );
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        List<Customer> customers = [];
        for (final Map<String, dynamic> json in data)
          customers.add(Customer.fromJson(json));
        return customers.map((customer) => customer.custName).toList();
      } else if (res.statusCode == 400) {
        return Future.error(jsonDecode(res.body)["message"]);
      } else {
        return Future.error(
          Strings.unknownError(statusCode: res.statusCode, body: res.body),
        );
      }
    } catch (e) {
      return Future.error(Strings.unexpectedError);
    }
  }
}
