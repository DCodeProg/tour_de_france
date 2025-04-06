import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "404",
              style: TextTheme.of(context).displayLarge,
            ),
            SizedBox(height: 16),
            Text(
              "Page not found :/",
              style: TextTheme.of(context).headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/'),
              icon: Icon(Icons.arrow_back),
              label: Text(
                "Retour à la page d'accueil"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
