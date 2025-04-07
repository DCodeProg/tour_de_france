import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';
import 'package:tour_de_france/features/equipes/domain/repositories/equipes_repository.dart';

class GetAllEquipes implements UseCase<List<Equipe>, NoParams> {
  final EquipesRepository repository;

  GetAllEquipes(this.repository);

  @override
  Future<Either<Failure, List<Equipe>>> call(NoParams params) async {
    return await repository.getAllEquipes();
  }
}