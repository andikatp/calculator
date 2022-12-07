import 'package:calculator/components/button_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ButtonComponent(
        text: '1',
      )),
    );
  }
}
