import 'package:factureo/src/core/routing/router.dart';
import 'package:factureo/src/core/theme/theme.dart';
import 'package:factureo/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class FactureoApp extends StatefulWidget {
  const FactureoApp({super.key});

  @override
  State<FactureoApp> createState() => _FactureoAppState();
}

class _FactureoAppState extends State<FactureoApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _handleToggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeController(
      themeMode: _themeMode,
      onToggleTheme: _handleToggleTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routeController,
        initialRoute: RoutePathNames.invoicesCreationScreen,
        themeMode: _themeMode,
        theme: buildAppTheme(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent,
            brightness: Brightness.light,
          ),
        ),
        darkTheme: buildAppTheme(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent,
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
