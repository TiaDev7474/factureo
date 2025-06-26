import 'package:factureo/src/core/utils/format.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.dateController.text = formatDate(DateTime.now());
    });
  }

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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (date) {
                        setState(() {
                          widget.dateController.text = formatDate(
                            date.toLocal(),
                          );
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
        suffixIcon: Icon(Icons.expand_more),
        labelText: widget.label,
      ),
      readOnly: true,
    );
  }
}
