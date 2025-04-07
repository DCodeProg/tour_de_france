part of 'equipes_bloc.dart';

abstract class EquipesEvent extends Equatable {
  const EquipesEvent();

  @override
  List<Object> get props => [];
}

class EquipesGetAllEquipesEvent extends EquipesEvent {}
