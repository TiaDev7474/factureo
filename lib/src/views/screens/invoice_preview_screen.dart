import 'package:factureo/src/core/utils/format.dart';
import 'package:factureo/src/data/model/article_model.dart';
import 'package:factureo/src/data/model/invoice_model.dart';
import 'package:flutter/material.dart';

class InvoicePreviewScreen extends StatelessWidget {
  const InvoicePreviewScreen({super.key, required this.invoice});
  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Aperçu', style: textTheme.titleLarge)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0.6,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                _buildClientInfo(context),
                const SizedBox(height: 32),
                _buildItemsTable(context),
                const SizedBox(height: 24),
                _buildTotalsSummary(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'FACTURE',
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Date d\'émission',
              style: textTheme.labelSmall?.copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(
              formatDate(invoice.invoiceDate),
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildClientInfo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primary = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facturé à:',
          style: textTheme.labelLarge?.copyWith(
            color: primary,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.person, size: 32, color: primary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(invoice.clientName, style: textTheme.titleMedium),
                Text(invoice.clientEmail, style: textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItemsTable(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2.5),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
      },
      children: [
        _buildTableHeader(context),
        ...invoice.items.map((e) => _buildTableRow(context, e)),
      ],
    );
  }

  TableRow _buildTableHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headerStyle = textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Description', style: headerStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Qté', style: headerStyle, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Prix', style: headerStyle, textAlign: TextAlign.right),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Total', style: headerStyle, textAlign: TextAlign.right),
        ),
      ],
    );
  }

  TableRow _buildTableRow(BuildContext context, ArticleModel item) {
    final textTheme = Theme.of(context).textTheme;
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(item.description, style: textTheme.bodyMedium),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            item.quantity.toString(),
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            '${item.unitPrice.toStringAsFixed(2)} €',
            textAlign: TextAlign.right,
            style: textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            '${item.totalHT.toStringAsFixed(2)} €',
            textAlign: TextAlign.right,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalsSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubtotalRow(context),
        const SizedBox(height: 8),
        _buildTaxRow(context),
        const SizedBox(height: 12),
        _buildTotalRow(context),
      ],
    );
  }

  Widget _buildSubtotalRow(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Sous-total HT:', style: textTheme.bodyMedium),
        Text(
          formatToReadableCurrencyValue(invoice.totalHT, symbol: "€"),
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildTaxRow(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('TVA (20%):', style: textTheme.bodyMedium),
        Text(
          formatToReadableCurrencyValue(invoice.tva, symbol: "€"),
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildTotalRow(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOTAL TTC:',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            Text(
              formatToReadableCurrencyValue(invoice.totalTTC, symbol: "€"),
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
