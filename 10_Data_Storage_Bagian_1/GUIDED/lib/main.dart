import 'package:flutter/material.dart';

import 'view/my_db_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Database - Sqflite',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyDbView(),
    );
  }
}
