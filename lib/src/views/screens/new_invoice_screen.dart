import 'package:factureo/src/core/routing/router.dart';
import 'package:factureo/src/core/widgets/logo.dart';
import 'package:factureo/src/core/widgets/theme_switch.dart';
import 'package:factureo/src/data/model/article_model.dart';
import 'package:factureo/src/data/model/invoice_model.dart';
import 'package:factureo/src/views/widgets/invoice_form.dart';
import 'package:flutter/material.dart';

class NewInvoiceScreen extends StatefulWidget {
  const NewInvoiceScreen({super.key});

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  InvoiceModel newInvoice = InvoiceModel(
    clientName: '',
    clientEmail: '',
    invoiceDate: DateTime.now(),
    items: [],
  );
  handleOnCreateDetail(String name, String email, DateTime date) {
    setState(() {
      newInvoice = newInvoice.copyWith(
        clientName: name,
        clientEmail: email,
        invoiceDate: date,
      );
    });
  }

  handleRemoveArticle(int index) {
    setState(() {
      newInvoice = newInvoice.removeArticle(index);
    });
  }

  handleAddArticle(ArticleModel newArticle) {
    setState(() {
      newInvoice = newInvoice.addArticle(newArticle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const FactureoLogo(), actions: [ThemeModeSwitch()]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InvoiceForm(
              newInvoice: newInvoice,
              onDetailsChanged: handleOnCreateDetail,
              handleAddArticle: handleAddArticle,
              handleRemoveArticle: handleRemoveArticle,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.preview),
            label: const Text("Prévisualiser la facture"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutePathNames.invoicePreviewScreen,
                arguments: newInvoice,
              );
            },
          ),
        ),
      ),
    );
  }
}
