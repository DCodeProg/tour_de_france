import 'package:fpdart/src/either.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/repositories/etapes_repository.dart';

class GetAllEtapes implements UseCase<List<Etape>, NoParams> {
  final EtapesRepository etapesRepository;
  GetAllEtapes(this.etapesRepository);

  @override
  Future<Either<Failure, List<Etape>>> call(NoParams params) async {
    return await etapesRepository.getAllEtapes();
  }
}
