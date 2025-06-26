import 'package:factureo/src/core/utils/format.dart';
import 'package:factureo/src/core/utils/input_validation.dart';
import 'package:factureo/src/data/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewArticleButton extends StatelessWidget {
  final Function(ArticleModel) onArticleCreated;

  const NewArticleButton({super.key, required this.onArticleCreated});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          enableDrag: true,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder:
              (context) => NewArticleForm(onArticleCreated: onArticleCreated),
        );
      },
      icon: const Icon(Icons.add),
      label: const Text('Ajouter un article'),
    );
  }
}

class NewArticleForm extends StatefulWidget {
  final Function(ArticleModel) onArticleCreated;

  const NewArticleForm({super.key, required this.onArticleCreated});

  @override
  State<NewArticleForm> createState() => _NewArticleFormState();
}

class _NewArticleFormState extends State<NewArticleForm> {
  final _articleFormKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();

  double _totalHT = 0.0;
  late final ArticleModel article;

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(_calculateTotal);
    _unitPriceController.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _quantityController.dispose();
    _unitPriceController.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final unitPrice = double.tryParse(_unitPriceController.text) ?? 0.0;
    setState(() {
      _totalHT = quantity * unitPrice;
    });
  }

  void _submitForm() {
    if (_articleFormKey.currentState!.validate()) {
      article = ArticleModel(
        description: _descriptionController.text.trim(),
        quantity: int.parse(_quantityController.text),
        unitPrice: double.parse(_unitPriceController.text),
      );
      widget.onArticleCreated(article);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nouvel Article',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Form(
              key: _articleFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Entrez la description de l\'article',
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _quantityController,
                          decoration: InputDecoration(
                            labelText: 'Quantité',
                            prefixIcon: Icon(Icons.numbers),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            return InputValidation.validateNumericValue(
                              value,
                              invalidMessage: "Quantité Invalide",
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _unitPriceController,
                          decoration: InputDecoration(
                            labelText: 'Prix unitaire HT',
                            suffixText: '€',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            return InputValidation.validateNumericValue(
                              value,
                              invalidMessage: "Prix unitaire invalide",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Montant total HT:',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        formatToReadableCurrencyValue(_totalHT, symbol: "€"),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Annuler'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Ajouter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
