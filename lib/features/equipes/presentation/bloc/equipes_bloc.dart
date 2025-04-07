import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/equipes/domain/entities/equipe.dart';
import 'package:tour_de_france/features/equipes/domain/usecases/get_all_equipes.dart';

part 'equipes_event.dart';
part 'equipes_state.dart';

class EquipesBloc extends Bloc<EquipesEvent, EquipesState> {
  final GetAllEquipes _getAllEquipes;

  EquipesBloc(this._getAllEquipes) : super(EquipesInitial()) {
    on<EquipesEvent>((event, emit) => emit(EquipesLoading()));
    on<EquipesGetAllEquipesEvent>(_onGetAllEquipesEvent);
  }

  void _onGetAllEquipesEvent(
    EquipesGetAllEquipesEvent event,
    Emitter<EquipesState> emit,
  ) async {
    final res = await _getAllEquipes(NoParams());

    res.fold(
      (l) => emit(EquipesFailure(l.message)),
      (r) => emit(EquipesDisplaySucess(r)),
    );
  }
}
