import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/repositories/etapes_repository.dart';

class RemoveEtape implements UseCase<Etape, RemoveEtapeParams> {
  final EtapesRepository etapesRepository;

  RemoveEtape(this.etapesRepository);

  @override
  Future<Either<Failure, Etape>> call(RemoveEtapeParams params) async {
    return await etapesRepository.removeEtape(
      annee: params.annee,
      numero: params.numero,
    );
  }
}

class RemoveEtapeParams {
  final int annee;
  final int numero;

  RemoveEtapeParams({required this.annee, required this.numero});
}
