import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flexible vs Expanded"),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Text(
              "Flexible",
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.red,
                ),
                Flexible(
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                    child: const Text(
                        "This is flexible widget, it takes up remaining space but can shrink if needed"),
                  ),
                ),
                const Icon(Icons.sentiment_satisfied_alt_rounded)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Expanded",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.red,
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                    child: const Text(
                        "This is flexible widget, it takes up remaining space but can shrink if needed"),
                  ),
                ),
                const Icon(Icons.sentiment_satisfied_alt_rounded)
              ],
            )
          ],
        ));
  }
}
