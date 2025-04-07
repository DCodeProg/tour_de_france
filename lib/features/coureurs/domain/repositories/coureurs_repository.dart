import 'package:fpdart/fpdart.dart';
import 'package:tour_de_france/core/errors/failures.dart';
import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';

abstract interface class CoureursRepository {
  Future<Either<Failure, List<Coureur>>> getAllCoureurs();
}