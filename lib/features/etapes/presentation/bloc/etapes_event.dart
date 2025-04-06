part of 'etapes_bloc.dart';

abstract class EtapesEvent extends Equatable {
  const EtapesEvent();

  @override
  List<Object> get props => [];
}

class EtapesGetAllEtapesEvent extends EtapesEvent {}
