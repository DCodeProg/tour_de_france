import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/etapes/domain/entities/etape.dart';
import 'package:tour_de_france/features/etapes/domain/usecases/get_all_etapes.dart';

part 'etapes_event.dart';
part 'etapes_state.dart';

class EtapesBloc extends Bloc<EtapesEvent, EtapesState> {
  final GetAllEtapes _getAllEtapes;

  EtapesBloc(this._getAllEtapes) : super(EtapesInitial()) {
    on<EtapesEvent>((event, emit) => emit(EtapesLoading()));
    on<EtapesGetAllEtapesEvent>(_onGetAllEtapesEvent);
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
}
