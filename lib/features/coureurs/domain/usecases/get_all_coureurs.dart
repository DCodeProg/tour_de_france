import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';
import 'package:tour_de_france/features/coureurs/domain/repositories/coureurs_repository.dart';

class GetAllCoureurs implements UseCase<List<Coureur>, NoParams> {
  final CoureursRepository repository;

  GetAllCoureurs(this.repository);

  @override
  Future<Either<Failure, List<Coureur>>> call(NoParams params) async {
    return await repository.getAllCoureurs();
  }
}