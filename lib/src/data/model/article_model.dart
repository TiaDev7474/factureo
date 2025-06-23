import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String description;
  final int quantity;
  final double unitPrice;

  const ArticleModel({
    required this.description,
    required this.quantity,
    required this.unitPrice,
  });

  double get totalHT => quantity * unitPrice;

  ArticleModel copyWith({
    String? description,
    int? quantity,
    double? unitPrice,
  }) {
    return ArticleModel(
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  @override
  List<Object?> get props => [description, quantity, unitPrice];
}
