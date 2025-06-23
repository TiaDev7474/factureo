import 'package:factureo/src/views/screens/invoice_preview_screen.dart';
import 'package:factureo/src/views/screens/invoices_screen.dart';
import 'package:factureo/src/views/screens/new_invoice_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutePathNames {
  static const String invoicesScreen = 'invoices';
  static const String invoicesCreationScreen = "invoiceCreation";
  static const String invoicePreviewScreen = "invoicePreview";
}

Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case RoutePathNames.invoicesScreen:
      return MaterialPageRoute(
        builder: (BuildContext context) => const InvoicesScreen(),
      );
    case RoutePathNames.invoicesCreationScreen:
      return MaterialPageRoute(
        builder: (BuildContext context) => const NewInvoiceScreen(),
      );
    case RoutePathNames.invoicePreviewScreen:
      return MaterialPageRoute(
        builder: (BuildContext context) => const InvoicePreviewScreen(),
      );
    default:
      throw ("this route is not implemented yet");
  }
}
