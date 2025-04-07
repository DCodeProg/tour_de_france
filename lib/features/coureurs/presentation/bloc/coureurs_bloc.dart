import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tour_de_france/core/usecase/usecase.dart';
import 'package:tour_de_france/features/coureurs/domain/entities/coureur.dart';
import 'package:tour_de_france/features/coureurs/domain/usecases/get_all_coureurs.dart';

part 'coureurs_event.dart';
part 'coureurs_state.dart';

class CoureursBloc extends Bloc<CoureursEvent, CoureursState> {
  final GetAllCoureurs _getAllCoureurs;

  CoureursBloc(this._getAllCoureurs) : super(CoureursInitial()) {
    on<CoureursEvent>((event, emit) => emit(CoureursLoading()));
    on<CoureursGetAllCoureursEvent>(_onGetAllCoureursEvent);
  }
  
  void _onGetAllCoureursEvent(
    CoureursGetAllCoureursEvent event,
    Emitter<CoureursState> emit,
  ) async {
    final res = await _getAllCoureurs(NoParams());

    res.fold(
      (l) => emit(CoureursFailure(l.message)),
      (r) => emit(CoureursDisplaySucess(r)),
    );
  }
}
