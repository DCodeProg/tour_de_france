part of 'coureurs_bloc.dart';

abstract class CoureursState extends Equatable {
  const CoureursState();

  @override
  List<Object> get props => [];
}

class CoureursInitial extends CoureursState {}

class CoureursLoading extends CoureursState {}

class CoureursFailure extends CoureursState {
  final String error;
  const CoureursFailure(this.error);
}

class CoureursDisplaySucess extends CoureursState {
  final List<Coureur> coureurs;
  const CoureursDisplaySucess(this.coureurs);
}
