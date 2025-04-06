import 'package:fpdart/src/either.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/etapes/data/datasources/etapes_remote_datasource.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/repositories/etapes_repository.dart';

class EtapesRepositoryImpl implements EtapesRepository {
  final EtapesRemoteDatasource etapesRemoteDatasource;

  EtapesRepositoryImpl(this.etapesRemoteDatasource);

  @override
  Future<Either<Failure, List<Etape>>> getAllEtapes() async {
    try {
      final etapes = await etapesRemoteDatasource.getAllEtapes();
      return right(etapes);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
