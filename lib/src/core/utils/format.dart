import 'package:intl/intl.dart';

String formatToReadableCurrencyValue(double value, {required String symbol}) {
  return "$symbol${value.toStringAsFixed(2)}";
}

String formatDate(DateTime date) {
  return DateFormat.yMMMEd('fr_FR').format(date);
}
