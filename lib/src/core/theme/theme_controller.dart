import 'package:flutter/material.dart';

class ThemeController extends InheritedWidget {
  final ThemeMode themeMode;
  final void Function(bool isDarkMode) onToggleTheme;

  const ThemeController({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
    required super.child,
  });

  static ThemeController of(BuildContext context) {
    final ThemeController? result =
        context.dependOnInheritedWidgetOfExactType<ThemeController>();
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeController old) {
    return themeMode != old.themeMode;
  }
}
