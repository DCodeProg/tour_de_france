import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';

class EtapeModel extends Etape {
  EtapeModel({
    required super.annee,
    required super.numero,
    required super.type,
    required super.date,
    required super.distance,
    required super.villeDepart,
    required super.villeArrivee,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'annee_edition': annee,
      'numero': numero,
      'type': type,
      'date': date.toIso8601String(),
      'distance': distance,
      'vd': villeDepart,
      'va': villeArrivee,
    };
  }

  factory EtapeModel.fromJson(Map<String, dynamic> map) {
    return EtapeModel(
      annee: map['annee_edition'] as int,
      numero: map['numero'] as int,
      type: map['type'] as String,
      date: DateTime.parse(map['date']),
      distance: map['distance'] as double,
      villeDepart: map['vd']['nom'] as String?,
      villeArrivee: map['va']['nom'] as String?,
    );
  }
}
