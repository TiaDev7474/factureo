import 'package:factureo/app/factureo_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting(
    'fr_FR',
    null,
  ).then((_) => runApp(const FactureoApp()));
}
