import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';

abstract interface class EtapesRepository {
  Future<Either<Failure, List<Etape>>> getAllEtapes();
  Future<Either<Failure, Etape>> addEtape({
    required int annee,
    required int numero,
    required String type,
    required DateTime date,
    required double distance,
    String? villeDepart,
    String? villeArrivee,
  });
  Future<Either<Failure, Etape>> removeEtape({
    required int annee,
    required int numero,
  });
}
