import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';

class CoureurCard extends StatelessWidget {
  final Coureur coureur;
  const CoureurCard({super.key, required this.coureur});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return Card(
      child: ListTile(
        leading: CircleAvatar(radius: 30, child: Icon(Icons.pedal_bike)),
        title: Text("${coureur.nom}  ${coureur.prenom.substring(0, 1) + coureur.prenom.substring(1).toLowerCase()}"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              spacing: 6,
              children: [
                Icon(Icons.flag_outlined, size: 16),
                Text("${coureur.nationalite}"),
              ],
            ),
            Row(
              spacing: 6,
              children: [
                Icon(Icons.cake, size: 16),
                Text("${dateFormat.format(coureur.dateNaissance)}   ${AgeCalculator.age(coureur.dateNaissance).years} ans"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
