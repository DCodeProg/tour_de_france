import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_de_france/features/coureurs/presentation/bloc/coureurs_bloc.dart';
import 'package:tour_de_france/features/coureurs/presentation/widgets/coureur_card.dart';

class CoureursPage extends StatelessWidget {
  const CoureursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des coureurs")),
      body: BlocBuilder<CoureursBloc, CoureursState>(
        builder: (context, state) {
          if (state is CoureursFailure) {
            return Center(child: Text(state.error));
          }
          if (state is CoureursLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CoureursDisplaySucess) {
            return ListView.builder(
              itemCount: state.coureurs.length,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final coureur = state.coureurs[index];
                return CoureurCard(coureur: coureur);
              },
            );
          }
          return const Placeholder();
        },
      ),
    );
  }
}
