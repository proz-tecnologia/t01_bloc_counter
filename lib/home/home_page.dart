import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t01_bloc_counter/di/injection.dart';
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
    controller = getIt.get<HomeCubit>();
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
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 32),
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
