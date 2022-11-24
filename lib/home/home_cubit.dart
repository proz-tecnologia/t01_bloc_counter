// class HomeCubit extends Cubit<int> {
//   HomeCubit() : super(0);

//   void increment() {
//     emit(state + 1);
//   }

//   void decrement() {
//     emit(state - 1);
//   }
// }

import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t01_bloc_counter/home/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Future<void> getAlgumaCoisaDoEndpoint() async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 8));
    final random = Random();
    if (random.nextBool()) {
      return emit(HomeErrorState());
    }
    emit(HomeSuccessState());
  }
}
