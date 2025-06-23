import 'package:factureo/src/core/routing/widgets/title.dart';
import 'package:factureo/src/views/widgets/invoice_form.dart';
import 'package:flutter/material.dart';

class NewInvoiceScreen extends StatelessWidget {
  const NewInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ScreenTitle(title: "Nouvelle facture")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const InvoiceForm(),
          ),
        ),
      ),
    );
  }
}
