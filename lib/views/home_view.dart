import 'package:classic/views/calculator.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(),
        body: SafeArea(
          // bottom: false,
          child: CalculatorView(),
        ));
  }
}
