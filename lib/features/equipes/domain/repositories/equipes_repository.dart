import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';

abstract interface class EquipesRepository {
  Future<Either<Failure, List<Equipe>>> getAllEquipes();
}
