import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo_list/data/database.dart';
import 'pages/home_page.dart';

void main() async {
  // var path = Directory.current.path;

  // init the hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class Directory {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
