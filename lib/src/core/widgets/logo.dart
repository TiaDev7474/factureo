import 'package:flutter/material.dart';

class FactureoLogo extends StatelessWidget {
  const FactureoLogo({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.receipt_long,
          color: theme.colorScheme.primary,
          size: size * 0.2,
        ),
        SizedBox(width: 8),
        Text(
          'factureo',
          style: TextStyle(
            fontSize: size * 0.2,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
