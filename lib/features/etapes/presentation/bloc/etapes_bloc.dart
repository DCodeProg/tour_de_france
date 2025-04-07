import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/usecases/add_etape.dart';
import 'package:tour_de_france/features/etapes/domain/usecases/get_all_etapes.dart';
import 'package:tour_de_france/features/etapes/domain/usecases/remove_etape.dart';

part 'etapes_event.dart';
part 'etapes_state.dart';

class EtapesBloc extends Bloc<EtapesEvent, EtapesState> {
  final GetAllEtapes _getAllEtapes;
  final AddEtape _addEtape;
  final RemoveEtape _removeEtape;

  EtapesBloc(this._getAllEtapes, this._addEtape, this._removeEtape)
    : super(EtapesInitial()) {
    on<EtapesEvent>((event, emit) => emit(EtapesLoading()));
    on<EtapesGetAllEtapesEvent>(_onGetAllEtapesEvent);
    on<EtapesAddEtapeEvent>(_onAddEtapeEvent);
    on<EtapesRemoveEtapeEvent>(_onRemoveEtapeEvent);
  }

  void _onGetAllEtapesEvent(
    EtapesGetAllEtapesEvent event,
    Emitter<EtapesState> emit,
  ) async {
    final res = await _getAllEtapes(NoParams());

    res.fold(
      (l) => emit(EtapesFailure(l.message)),
      (r) => emit(EtapesDisplaySucess(r)),
    );
  }

  void _onAddEtapeEvent(
    EtapesAddEtapeEvent event,
    Emitter<EtapesState> emit,
  ) async {
    final res = await _addEtape(
      AddEtapeParams(
        annee: event.annee,
        numero: event.numero,
        type: event.type,
        date: event.date,
        distance: event.distance,
      ),
    );

    res.fold(
      (l) => emit(EtapesFailure(l.message)),
      (r) => emit(EtapesAddEtapeSucess(r)),
    );
  }

  void _onRemoveEtapeEvent(
    EtapesRemoveEtapeEvent event,
    Emitter<EtapesState> emit,
  ) async {
    final res = await _removeEtape(
      RemoveEtapeParams(annee: event.annee, numero: event.numero),
    );

    res.fold((l) => emit(EtapesFailure(l.message)), (r) {
      emit(EtapesRemoveEtapeSucess(r));
      add(EtapesGetAllEtapesEvent());
    });
  }
}
