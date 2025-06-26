import 'package:factureo/src/data/model/invoice_model.dart';
import 'package:factureo/src/views/screens/invoice_preview_screen.dart';
import 'package:factureo/src/views/screens/new_invoice_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutePathNames {
  static const String invoicesCreationScreen = "invoiceCreation";
  static const String invoicePreviewScreen = "invoicePreview";
}

Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case RoutePathNames.invoicesCreationScreen:
      return MaterialPageRoute(
        builder: (BuildContext context) => const NewInvoiceScreen(),
      );
    case RoutePathNames.invoicePreviewScreen:
      final invoice = settings.arguments as InvoiceModel;
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder:
            (BuildContext context) => InvoicePreviewScreen(invoice: invoice),
      );
    default:
      throw ("this route is not implemented yet");
  }
}
