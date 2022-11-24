import 'package:get_it/get_it.dart';
import 'package:t01_bloc_counter/home/home_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeCubit>(HomeCubit());
  //getIt.registerSingleton<HomeRepository>(HomeRepository());
  //getIt.registerLazySingleton<HomeCubit>(
  //() => HomeCubit(getIt.get<HomeRepository>()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
