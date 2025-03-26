import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "AR One Sans",
      "ADLaM Display",
    );
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "Tour De France",
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
    );
  }
}
