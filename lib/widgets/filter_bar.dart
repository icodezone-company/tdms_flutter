import 'package:flutter/material.dart';
import 'package:tdms_flutter/core/utils/constants.dart';

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

  @override
  void initState() {
    fromDate = widget.fromDate;
    toDate = widget.toDate;
    customerName = widget.customerName;
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
                child: DropdownButtonFormField<String>(
                  initialValue: widget.customerName,
                  items: ["الكل", "زبون 1", "زبون 2", "زبون 3"]
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
}
