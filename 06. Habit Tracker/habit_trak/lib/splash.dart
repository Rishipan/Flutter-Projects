import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: AvatarGlow(
          endRadius: 150,
          glowColor: Colors.green.shade300,
          duration: const Duration(milliseconds: 4000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          child: const Text(
            '🚴‍♂️',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          //   ),
        ),
      ),
    );
  }
}
