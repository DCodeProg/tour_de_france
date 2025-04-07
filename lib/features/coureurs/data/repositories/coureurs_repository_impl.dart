import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/coureurs/data/datasources/coureurs_remote_datasource.dart';
import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';
import 'package:tour_de_france/features/coureurs/domain/repositories/coureurs_repository.dart';

class CoureursRepositoryImpl implements CoureursRepository {
  final CoureursRemoteDatasource coureursRemoteDatasource;

  CoureursRepositoryImpl(this.coureursRemoteDatasource);

  @override
  Future<Either<Failure, List<Coureur>>> getAllCoureurs() async {
    try {
      final coureurs = await coureursRemoteDatasource.getAllCoureurs();
      return right(coureurs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
