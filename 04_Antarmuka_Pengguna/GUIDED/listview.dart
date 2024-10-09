import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan listview'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(
              child: Text("Type A"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 54, 143, 244),
            child: Center(
              child: Text("Type B"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 24, 222, 57),
            child: Center(
              child: Text("Type C"),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 241, 54, 244),
            child: Center(
              child: Text("Type D"),
            ),
          ),
        ],
      ),
    );
  }
}
