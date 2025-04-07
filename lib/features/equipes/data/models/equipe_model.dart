import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';

class EquipeModel extends Equipe {
  EquipeModel({required super.code, required super.nom, required super.pays});

  factory EquipeModel.fromJson(Map<String, dynamic> json) {
    return EquipeModel(
      code: json['code'],
      nom: json['nom'],
      pays: json['pays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'nom': nom, 'pays': pays};
  }
}
