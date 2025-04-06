import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class DossierTechnique extends StatelessWidget {
  const DossierTechnique({super.key});

  Future<String> loadReadme() async {
    return await rootBundle.loadString('README.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dossier Technique"),
      ),
      backgroundColor: ColorScheme.of(context).surfaceContainerLowest,
      body: FutureBuilder<String>(
        future: loadReadme(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Une erreur est survenue !"));
          } else {
            return Markdown(data: snapshot.data ?? "", padding: EdgeInsets.all(24),);
          }
        },
      ),
    );
  }
}