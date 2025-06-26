import 'package:factureo/src/data/model/article_model.dart';
import 'package:factureo/src/data/model/invoice_model.dart';
import 'package:factureo/src/views/widgets/article_item.dart';
import 'package:factureo/src/views/widgets/invoice_detail_form.dart';
import 'package:factureo/src/views/widgets/invoice_summary.dart';
import 'package:factureo/src/views/widgets/new_article_form.dart';
import 'package:flutter/material.dart';

class InvoiceForm extends StatelessWidget {
  const InvoiceForm({
    super.key,
    required this.newInvoice,
    required this.handleAddArticle,
    required this.handleRemoveArticle,
    required this.onDetailsChanged,
  });

  final InvoiceModel newInvoice;
  final Function(ArticleModel) handleAddArticle;
  final Function(int) handleRemoveArticle;
  final Function(String clientName, String clientEmail, DateTime invoiceDate)
  onDetailsChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InvoiceDetailForm(onDetailsChanged: onDetailsChanged),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Articles", style: Theme.of(context).textTheme.titleLarge),
            NewArticleButton(
              onArticleCreated: (newArticle) {
                handleAddArticle(newArticle);
              },
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ArticleList(
            articles: newInvoice.items,
            onRemoveArticle: handleRemoveArticle,
          ),
        ),
        InvoiceSummary(invoice: newInvoice),
      ],
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.onRemoveArticle,
  });

  final List<ArticleModel> articles;
  final Function(int index) onRemoveArticle;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun article ajouté',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Commencez par ajouter votre premier article',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, index) {
        final item = articles[index];
        return ArticleItem(
          article: item,
          onDelete: () {
            onRemoveArticle(index);
          },
        );
      },
    );
  }
}
