import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';

class CoureurModel extends Coureur {
  CoureurModel({
    required super.id,
    required super.nom,
    required super.prenom,
    required super.dateNaissance,
    required super.nationalite,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'date_naissance': dateNaissance.toIso8601String(),
      'nationalite': nationalite,
    };
  }

  factory CoureurModel.fromJson(Map<String, dynamic> map) {
    return CoureurModel(
      id: map['id'] as String,
      nom: map['nom'] as String? ?? "",
      prenom: map['prenom'] as String? ?? "",
      dateNaissance: DateTime.parse(map['date_naissance']),
      nationalite: map['nationalite'] as String?,
    );
  }
}