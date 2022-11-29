import 'package:flutter_modular/flutter_modular.dart';
import 'package:t01_bloc_counter/home/home_cubit.dart';
import 'package:t01_bloc_counter/home/home_detail.dart';
import 'package:t01_bloc_counter/home/home_repository.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.singleton(
        //   (i) => HomeRepository(),
        // ),
        // Bind.singleton(
        //   (i) => HomeCubit(i(),i<HomeRepository>()),
        // )
        Bind.factory<HomeRepository>((i) => DioRepository()),
        Bind.factory((i) => HomeCubit(i<HomeRepository>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MyHomePage(
            title: 'Kaio toop',
          ),
        ),
        ChildRoute(
          '/home-detail',
          child: (context, args) => const HomeDetail(),
        ),
      ];
}
