import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'main_module.dart';

void main() {
  //setup();
  runApp(
    ModularApp(
      module: MainModule(),
      child: const MyApp(),
    ),
  );
}
