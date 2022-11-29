import 'package:get_it/get_it.dart';
import 'package:t01_bloc_counter/home/home_cubit.dart';
import 'package:t01_bloc_counter/home/home_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepository>(DioRepository());
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt.get<HomeRepository>()));
  //getIt.registerLazySingleton<HomeCubit>(
  //() => HomeCubit(getIt.get<HomeRepository>()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
