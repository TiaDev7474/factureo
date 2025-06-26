import 'package:flutter/material.dart';

ThemeData buildAppTheme({required ColorScheme colorScheme}) {
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.outline.withAlpha(50),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.outline.withAlpha(25),
          width: 1,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),

      labelStyle: TextStyle(
        color: colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      hintStyle: TextStyle(
        color: colorScheme.onSurfaceVariant.withAlpha(120),
        fontSize: 16,
      ),

      errorStyle: TextStyle(color: colorScheme.error, fontSize: 12),
      prefixIconColor: colorScheme.onSurfaceVariant,
      suffixIconColor: colorScheme.onSurfaceVariant,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(elevation: WidgetStatePropertyAll(0.6)),
    ),
  );
}
