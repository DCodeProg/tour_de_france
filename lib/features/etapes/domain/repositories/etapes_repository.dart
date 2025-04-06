import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';

abstract interface class EtapesRepository {
  Future<Either<Failure, List<Etape>>> getAllEtapes();
}