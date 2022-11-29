import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Home Detail')),
    );
  }
}
