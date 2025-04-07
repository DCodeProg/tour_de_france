part of 'coureurs_bloc.dart';

abstract class CoureursEvent extends Equatable {
  const CoureursEvent();

  @override
  List<Object> get props => [];
}

class CoureursGetAllCoureursEvent extends CoureursEvent {}