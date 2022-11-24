import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t01_bloc_counter/home/home_events.dart';

class HomeBloc extends Bloc<HomeEvent, int> {
  HomeBloc() : super(0) {
    // on<IncrementHomeEvent>((event, emit) {
    //   emit(state + 1);
    // });
    on<IncrementHomeEvent>(_increment);
    on<DecrementHomeEvent>(_decrement);
  }

  Future<void> _decrement(HomeEvent event, Emitter emit) async {
    emit(state - 1);
  }

  Future<void> _increment(HomeEvent event, Emitter emit) async {
    emit(state + 1);
  }
}
