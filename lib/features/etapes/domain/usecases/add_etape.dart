import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/repositories/etapes_repository.dart';

class AddEtape implements UseCase<Etape, AddEtapeParams> {
  final EtapesRepository etapeRepository;

  AddEtape(this.etapeRepository);

  @override
  Future<Either<Failure, Etape>> call(AddEtapeParams params) async {
    return await etapeRepository.addEtape(
      annee: params.annee,
      numero: params.numero,
      type: params.type,
      date: params.date,
      distance: params.distance,
      villeDepart: params.villeDepart,
      villeArrivee: params.villeArrivee,
    );
  }
}

class AddEtapeParams {
  final int annee;
  final int numero;
  final String type;
  final DateTime date;
  final double distance;
  final String? villeDepart;
  final String? villeArrivee;

  AddEtapeParams({
    required this.annee,
    required this.numero,
    required this.type,
    required this.date,
    required this.distance,
    this.villeDepart,
    this.villeArrivee,
  });
}
