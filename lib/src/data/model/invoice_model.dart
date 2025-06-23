import 'package:equatable/equatable.dart';
import 'package:factureo/src/data/model/article_model.dart';

class InvoiceModel extends Equatable {
  final String clientName;
  final String clientEmail;
  final DateTime invoiceDate;
  final List<ArticleModel> items;

  const InvoiceModel({
    required this.clientName,
    required this.clientEmail,
    required this.invoiceDate,
    required this.items,
  });

  double get totalHT => items.fold(0.0, (sum, item) => sum + (item.totalHT));
  double get tva => totalHT * 0.2;
  double get totalTTC => totalHT + tva;

  InvoiceModel addArticle(ArticleModel article) {
    return copyWith(items: [...items, article]);
  }

  InvoiceModel removeArticle(int index) {
    if (index < 0 || index >= items.length) return this;
    final updatedItems = List<ArticleModel>.from(items)..removeAt(index);
    return copyWith(items: updatedItems);
  }

  InvoiceModel copyWith({
    String? clientName,
    String? clientEmail,
    DateTime? invoiceDate,
    List<ArticleModel>? items,
  }) {
    return InvoiceModel(
      clientName: clientName ?? this.clientName,
      clientEmail: clientEmail ?? this.clientEmail,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [clientName, clientEmail, invoiceDate, items];
}
