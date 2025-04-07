import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_de_france/features/equipes/presentation/bloc/equipes_bloc.dart';
import 'package:tour_de_france/features/equipes/presentation/widgets/equipe_card.dart';

class EquipesPage extends StatelessWidget {
  const EquipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des équipes")),
      body: BlocBuilder<EquipesBloc, EquipesState>(
        builder: (context, state) {
          if (state is EquipesFailure) {
            return Center(child: Text(state.error));
          }
          if (state is EquipesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is EquipesDisplaySucess) {
            return ListView.builder(
              itemCount: state.equipes.length,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final equipe = state.equipes[index];
                return EquipeCard(equipe: equipe);
              },
            );
          }
          return const Placeholder();
        },
      ),
    );
  }
}