import 'package:factureo/src/core/routing/router.dart';
import 'package:flutter/material.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Factures")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutePathNames.invoicesCreationScreen);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
