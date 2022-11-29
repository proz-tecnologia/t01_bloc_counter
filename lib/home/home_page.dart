import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:t01_bloc_counter/home/home_cubit.dart';
import 'package:t01_bloc_counter/home/home_states.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeCubit controller;

  @override
  void initState() {
    super.initState();
    //controller = getIt.get<HomeCubit>();
    controller = Modular.get<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<HomeCubit, HomeState>(
              bloc: controller,
              listener: (context, state) {
                if (state is HomeErrorState) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$state')),
                  );
                }
              },
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Text(
                      '$state',
                      style: const TextStyle(fontSize: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/home-detail');
                      },
                      child: const Text('navegar'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.getAlgumaCoisaDoEndpoint,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          // const SizedBox(width: 16),
          // FloatingActionButton(
          //   onPressed: controller.decrement,
          //   tooltip: 'Decrement',
          //   child: const Icon(Icons.remove),
          // )
        ],
      ),
    );
  }
}

class Robot {
  void spinAround() {}
  void rotate() {}
  void antenas() {}
}

abstract class Cut {}

abstract class Paint {}

class MyRobot extends Robot implements Paint {}

class MyRobot2 extends Robot implements Paint, Cut {}
