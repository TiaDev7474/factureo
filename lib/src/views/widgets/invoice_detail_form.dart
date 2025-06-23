import 'package:factureo/src/views/core/routing/widgets/date_input_picker.dart';
import 'package:flutter/material.dart';

class InvoiceDetailForm extends StatefulWidget {
  const InvoiceDetailForm({super.key});

  @override
  State<InvoiceDetailForm> createState() => _InvoiceDetailFormState();
}

class _InvoiceDetailFormState extends State<InvoiceDetailForm> {
  final invoiceDetailFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text("Details"),
          const SizedBox(height: 22),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              label: Text("Nom client"),
              filled: true,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text("Email client"),
              filled: true,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            validator: (value) {
              return null;
            },
          ),
          const SizedBox(height: 12),
          DateInputDatePickerField(
            dateController: _dateController,
            label: "Date facture",
          ),
        ],
      ),
    );
  }
}
