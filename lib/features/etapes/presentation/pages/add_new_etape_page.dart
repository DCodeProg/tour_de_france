import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/features/etapes/data/models/etape_model.dart';
import 'package:tour_de_france/features/etapes/data/datasources/etapes_remote_datasource.dart';
import 'package:tour_de_france/features/etapes/presentation/bloc/etapes_bloc.dart';

class AddNewEtapePage extends StatefulWidget {
  const AddNewEtapePage({super.key});

  @override
  State<AddNewEtapePage> createState() => _AddNewEtapePageState();
}

class _AddNewEtapePageState extends State<AddNewEtapePage> {
  final _formKey = GlobalKey<FormState>();
  final _anneeController = TextEditingController();
  final _numeroController = TextEditingController();
  final _typeController = TextEditingController();
  final _dateController = TextEditingController();
  final _distanceController = TextEditingController();
  final _villeDepartController = TextEditingController();
  final _villeArriveeController = TextEditingController();

  Future<void> _addEtape() async {
    if (_formKey.currentState?.validate() ?? false) {
      final etape = EtapeModel(
        annee: int.parse(_anneeController.text),
        numero: int.parse(_numeroController.text),
        type: _typeController.text,
        date: DateTime.parse(_dateController.text),
        distance: double.parse(_distanceController.text),
        villeDepart: _villeDepartController.text,
        villeArrivee: _villeArriveeController.text,
      );

      try {
        final datasource = EtapesRemoteDatasourceImpl(Supabase.instance.client);
        await datasource.addEtape(etape);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Étape ajoutée avec succès !")));
        context.go('/parcours/etapes');
        context.read<EtapesBloc>().add(
          EtapesGetAllEtapesEvent(),
        ); // Refresh the list of stages
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erreur : ${e.toString()}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une étape"),
        leading: IconButton(
          onPressed: () => context.go('/parcours/etapes'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: 600,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ajouter une étape",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextFormField(
                      controller: _anneeController,
                      decoration: InputDecoration(labelText: "Année"),
                      keyboardType: TextInputType.number,
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _numeroController,
                      decoration: InputDecoration(labelText: "Numéro"),
                      keyboardType: TextInputType.number,
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _typeController,
                      decoration: InputDecoration(labelText: "Type"),
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: "Date (YYYY-MM-DD)",
                      ),
                      keyboardType: TextInputType.datetime,
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _distanceController,
                      decoration: InputDecoration(labelText: "Distance"),
                      keyboardType: TextInputType.number,
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _villeDepartController,
                      decoration: InputDecoration(labelText: "Ville de départ"),
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    TextFormField(
                      controller: _villeArriveeController,
                      decoration: InputDecoration(labelText: "Ville d'arrivée"),
                      validator:
                          (value) =>
                              value?.isEmpty ?? true ? "Champ requis" : null,
                    ),
                    SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _addEtape,
                      icon: Icon(Icons.add),
                      label: Text("Ajouter"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _anneeController.dispose();
    _numeroController.dispose();
    _typeController.dispose();
    _dateController.dispose();
    _distanceController.dispose();
    _villeDepartController.dispose();
    _villeArriveeController.dispose();
    super.dispose();
  }
}
