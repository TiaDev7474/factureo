import 'package:factureo/src/core/utils/input_validation.dart';
import 'package:factureo/src/core/widgets/date_input_picker.dart';
import 'package:flutter/material.dart';

class InvoiceDetailForm extends StatefulWidget {
  const InvoiceDetailForm({super.key, required this.onDetailsChanged});

  final Function(String clientName, String clientEmail, DateTime invoiceDate)
  onDetailsChanged;

  @override
  State<InvoiceDetailForm> createState() => _InvoiceDetailFormState();
}

class _InvoiceDetailFormState extends State<InvoiceDetailForm> {
  final invoiceDetailFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_handleOnChange);
    _emailController.addListener(_handleOnChange);
    _dateController.addListener(_handleOnChange);
  }

  void _handleOnChange() {
    widget.onDetailsChanged(
      _nameController.text,
      _emailController.text,
      DateTime.tryParse(_dateController.text) ?? DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: invoiceDetailFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Détails", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 22),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              label: Text("Nom client"),
              prefixIcon: Icon(Icons.person_2_outlined),
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
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              return InputValidation.validateEmail(
                value,
                requiredMessage: "Email  requis",
                invalidMessage: "Invalide Email",
              );
            },
          ),
          const SizedBox(height: 12),
          DateInputDatePickerField(
            dateController: _dateController,
            label: "Date de facture",
          ),
        ],
      ),
    );
  }
}
