import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/equipes/data/datasources/equipes_remote_datasource.dart';
import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';
import 'package:tour_de_france/features/equipes/domain/repositories/equipes_repository.dart';

class EquipesRepositoryImpl implements EquipesRepository {
  final EquipesRemoteDataSource equipesRemoteDataSource;

  EquipesRepositoryImpl(this.equipesRemoteDataSource);

  @override
  Future<Either<Failure, List<Equipe>>> getAllEquipes() async {
    try {
      final equipes = await equipesRemoteDataSource.getAllEquipes();
      return right(equipes);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
