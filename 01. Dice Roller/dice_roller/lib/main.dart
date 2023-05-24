import 'package:flutter/material.dart';
import 'package:dice_roller/GradientContainer.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer.purple(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
