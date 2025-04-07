part of 'etapes_bloc.dart';

abstract class EtapesEvent extends Equatable {
  const EtapesEvent();

  @override
  List<Object> get props => [];
}

class EtapesGetAllEtapesEvent extends EtapesEvent {}

class EtapesAddEtapeEvent extends EtapesEvent {
  final int annee;
  final int numero;
  final String type;
  final DateTime date;
  final double distance;
  final String? villeDepart;
  final String? villeArrivee;

  const EtapesAddEtapeEvent({
    required this.annee,
    required this.numero,
    required this.type,
    required this.date,
    required this.distance,
    this.villeDepart,
    this.villeArrivee,
  });

  @override
  List<Object> get props => [
    annee,
    numero,
    type,
    date,
    distance,
    villeDepart ?? "",
    villeArrivee ?? "",
  ];
}

class EtapesRemoveEtapeEvent extends EtapesEvent {
  final int annee;
  final int numero;

  const EtapesRemoveEtapeEvent({required this.annee, required this.numero});

  @override
  List<Object> get props => [annee, numero];
}
