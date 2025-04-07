part of 'equipes_bloc.dart';

abstract class EquipesState extends Equatable {
  const EquipesState();

  @override
  List<Object> get props => [];
}

class EquipesInitial extends EquipesState {}

class EquipesLoading extends EquipesState {}

class EquipesFailure extends EquipesState {
  final String error;
  const EquipesFailure(this.error);
}

class EquipesDisplaySucess extends EquipesState {
  final List<Equipe> equipes;
  const EquipesDisplaySucess(this.equipes);
}
