import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/presentation/bloc/etapes_bloc.dart';

class EtapeCard extends StatelessWidget {
  final Etape etape;
  const EtapeCard({super.key, required this.etape});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM');
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: Text(
            etape.numero.toString(),
            style: TextTheme.of(context).headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        title: Text("Étape du ${dateFormat.format(etape.date)}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 6,
              children: [
                Icon(Icons.straighten, size: 16),
                Text("${etape.distance}km"),
              ],
            ),
            Row(
              spacing: 6,
              children: [Icon(Icons.terrain, size: 16), Text(etape.type)],
            ),
            Row(
              spacing: 6,
              children: [
                Icon(Icons.location_on, size: 16),
                Text("${etape.villeDepart} → ${etape.villeArrivee}"),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
            IconButton(
              onPressed: () {
                context.read<EtapesBloc>().add(
                  EtapesRemoveEtapeEvent(
                    annee: etape.annee,
                    numero: etape.numero,
                  ),
                );
                context.read()<EtapesBloc>().add(EtapesGetAllEtapesEvent());
              },
              icon: Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
