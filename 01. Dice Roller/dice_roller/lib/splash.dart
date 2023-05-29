import 'dart:async';

import 'package:dice_roller/GradientContainer.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const GradientContainer(Colors.purple, Colors.purple),
            )));
    ;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('data')));
  }
}
