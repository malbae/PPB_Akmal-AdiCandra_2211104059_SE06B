import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Custom Demo"),
            ),
          ),

          // SliverGrid -> tampilan grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.amber[100 * (index % 9)],
                    child: Column(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          size: 15,
                        ),
                        Text('Grid Item $index'),
                      ],
                    ));
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4,
            ),
          ),
        ],
      ),
    );
  }
}
