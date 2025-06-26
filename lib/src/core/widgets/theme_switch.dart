import 'package:factureo/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.of(context);
    return Switch(
      value: controller.themeMode == ThemeMode.dark,
      onChanged: controller.onToggleTheme,
    );
  }
}
