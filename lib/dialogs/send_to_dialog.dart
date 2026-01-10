import 'package:flutter/material.dart';

import '../core/utils/constants.dart';
import '../models/tracking.dart';

class SendToDialog extends StatefulWidget {
  const SendToDialog({super.key, required this.tracking});
  final Tracking tracking;

  @override
  State<SendToDialog> createState() => _SendToDialogState();
}

class _SendToDialogState extends State<SendToDialog> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? selectedStage;

  final notesController = TextEditingController();

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24),
      title: Center(child: const Text("إرسال إلى")),
      content: Form(
        key: formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: MediaQuery.sizeOf(context).width),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "إرسال إلى"),
              items: Constants.dyeingTitles
                  .map(
                    (stage) => DropdownMenuItem<String>(
                      value: stage,
                      child: Text(stage),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selectedStage = value;
              },
              validator: (value) {
                if (value == null) {
                  return "الرجاء اختيار المرحلة";
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: notesController,
              decoration: const InputDecoration(labelText: "ملاحظات"),
              maxLines: 3,
            ),
          ],
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
              final int dyeingId = Constants.dyeingByName[selectedStage]!;
              Navigator.of(context).pop({
                "tracking_id": widget.tracking.id,
                "send_to": selectedStage,
                "send_to_index": dyeingId,
                "note":
                    "${widget.tracking.notes}   ${notesController.text.trim()}"
                        .trim(),
              });
            } else if (_autovalidateMode == AutovalidateMode.disabled) {
              _autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
          child: const Text("إرسال"),
        ),
      ],
    );
  }
}
