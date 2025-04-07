part of 'etapes_bloc.dart';

abstract class EtapesState extends Equatable {
  const EtapesState();

  @override
  List<Object> get props => [];
}

class EtapesInitial extends EtapesState {}

class EtapesLoading extends EtapesState {}

class EtapesFailure extends EtapesState {
  final String error;
  const EtapesFailure(this.error);
}

class EtapesDisplaySucess extends EtapesState {
  final List<Etape> etapes;
  const EtapesDisplaySucess(this.etapes);
}

class EtapesAddEtapeSucess extends EtapesState {
  final Etape etape;
  const EtapesAddEtapeSucess(this.etape);
}

class EtapesRemoveEtapeSucess extends EtapesState {
  final Etape etape;
  const EtapesRemoveEtapeSucess(this.etape);
}