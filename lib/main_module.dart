import 'package:flutter_modular/flutter_modular.dart';
import 'package:t01_bloc_counter/home/home_module.dart';

class MainModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        //ModuleRoute('/perfil', module: PerfilModule()),
      ];
}
