import 'dart:io';

import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  // const DisplayScreen({super.key});
  final String imagePath;

  const DisplayScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Image.file(File(imagePath)),
    );
  }
}