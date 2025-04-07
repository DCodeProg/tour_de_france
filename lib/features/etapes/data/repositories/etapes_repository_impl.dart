import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/etapes/data/datasources/etapes_remote_datasource.dart';
import 'package:tour_de_france/features/etapes/data/models/etape_model.dart';
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

  @override
  Future<Either<Failure, Etape>> addEtape({
    required int annee,
    required int numero,
    required String type,
    required DateTime date,
    required double distance,
    String? villeDepart,
    String? villeArrivee,
  }) async {
    try {
      EtapeModel etape = EtapeModel(
        annee: annee,
        numero: numero,
        type: type,
        date: date,
        distance: distance,
        villeDepart: villeDepart,
        villeArrivee: villeArrivee,
      );

      final addedEtape = await etapesRemoteDatasource.addEtape(etape);
      return right(addedEtape);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Etape>> removeEtape({required int annee, required int numero}) async {
    try {
      final etape = await etapesRemoteDatasource.removeEtape(EtapeModel(annee: annee, numero: numero, type: '', date: DateTime.now(), distance: 0, villeDepart: '', villeArrivee: ''));
      return right(etape);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
