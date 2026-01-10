import 'package:flutter/material.dart';

import '../models/tracking.dart';

class StartWorkDialog extends StatefulWidget {
  const StartWorkDialog({super.key, required this.tracking});
  final Tracking tracking;

  @override
  State<StartWorkDialog> createState() => _StartWorkDialogState();
}

class _StartWorkDialogState extends State<StartWorkDialog> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final worker1Controller = TextEditingController();
  final worker2Controller = TextEditingController();
  final machineNoController = TextEditingController();

  @override
  void dispose() {
    worker1Controller.dispose();
    worker2Controller.dispose();
    machineNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24),
      title: Center(child: const Text("بدء العمل")),
      content: Form(
        key: formKey,
        autovalidateMode: _autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: MediaQuery.sizeOf(context).width),
              TextFormField(
                controller: worker1Controller,
                decoration: const InputDecoration(labelText: "اسم العامل 1"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "الرجاء إدخال اسم العامل الأول";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: worker2Controller,
                decoration: const InputDecoration(labelText: "اسم العامل 2"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: machineNoController,
                decoration: const InputDecoration(labelText: "رقم الماكينة"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "الرجاء إدخال رقم الماكينة";
                  }
                  if (int.tryParse(value) == null) {
                    return "رقم الماكينة يجب أن يكون رقمًا";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pop({
                "track_id": widget.tracking.id,
                "machine_no": int.parse(machineNoController.text),
                "first_worker_name": worker1Controller.text.trim(),
                "second_worker_name": worker2Controller.text.trim(),
              });
            } else if (_autovalidateMode == AutovalidateMode.disabled) {
              _autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
          child: const Text("بدء"),
        ),
      ],
    );
  }
}
