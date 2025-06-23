import 'package:factureo/src/views/data/model/article_model.dart';
import 'package:factureo/src/views/data/model/invoice_model.dart';
import 'package:factureo/src/views/widgets/article_item.dart';
import 'package:factureo/src/views/widgets/invoice_detail_form.dart';
import 'package:factureo/src/views/widgets/new_article_form.dart';
import 'package:flutter/material.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({super.key});

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
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

  handleAddArticle(ArticleModel newArticle) {
    setState(() {
      newInvoice = newInvoice.addArticle(newArticle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InvoiceDetailForm(),
            const Text("Articles"),
            Expanded(child: ArticleList(articles: newInvoice.items)),
            NewArticleButton(
              onArticleCreated: (newArticle) {
                handleAddArticle(newArticle);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return Center(child: Text('Aucun article ajouté'));
    }
    return ListView.separated(
      itemBuilder: (BuildContext context, index) {
        return ArticleItem(article: articles[index]);
      },
      separatorBuilder: (BuildContext context, index) => Divider(),
      itemCount: articles.length,
    );
  }
}
