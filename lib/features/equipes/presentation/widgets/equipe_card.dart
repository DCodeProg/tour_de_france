import 'package:flutter/material.dart';
import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';

class EquipeCard extends StatelessWidget {
  final Equipe equipe;
  const EquipeCard({super.key, required this.equipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(equipe.code),
        minLeadingWidth: 50,
        title: Text(equipe.nom),
        subtitle: Row(
          spacing: 6,
          children: [
            Icon(Icons.flag_outlined, size: 16),
            Text(equipe.pays),
          ],
        ),
      ),
    );
  }
}
