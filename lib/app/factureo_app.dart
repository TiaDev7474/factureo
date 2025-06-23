import 'package:factureo/src/views/core/routing/router.dart';
import 'package:flutter/material.dart';

class FactureoApp extends StatelessWidget {
  const FactureoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeController,
      initialRoute: RoutePathNames.invoicesScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
    );
  }
}
