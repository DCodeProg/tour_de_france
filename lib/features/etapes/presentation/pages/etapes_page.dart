import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_de_france/features/etapes/presentation/bloc/etapes_bloc.dart';
import 'package:tour_de_france/features/etapes/presentation/widgets/etape_card.dart';

class EtapesPage extends StatelessWidget {
  const EtapesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des étapes")),
      body: BlocBuilder<EtapesBloc, EtapesState>(
        builder: (context, state) {
          if (state is EtapesFailure) {
            return Center(child: Text(state.error));
          }
          if (state is EtapesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is EtapesDisplaySucess) {
            return ListView.builder(
              itemCount: state.etapes.length,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final etape = state.etapes[index];
                return EtapeCard(etape: etape);
              },
            );
          }
          return const Placeholder();
        },
      ),
    );
  }
}
