import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateInputDatePickerField extends StatefulWidget {
  const DateInputDatePickerField({
    super.key,
    required this.dateController,
    required this.label,
  });
  final TextEditingController dateController;
  final String label;

  @override
  State<DateInputDatePickerField> createState() =>
      _DateInputDatePickerFieldState();
}

class _DateInputDatePickerFieldState extends State<DateInputDatePickerField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Appliquer'),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (date) {
                        setState(() {
                          widget.dateController.text = date.toIso8601String();
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      controller: widget.dateController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range_rounded),
        labelText: widget.label,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      readOnly: true,
    );
  }
}
