import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WisataListScreen(),
    );
  }
}

class WisataListScreen extends StatelessWidget {
  final List<Wisata> wisataList = [
    Wisata(
      nama: 'Baturaden',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR40TtLzRhv4wKKgYNFe1wjcXnath1X09eGTw&s',
      deskripsi:
          'Baturaden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, sekitar 15 kilometer dari pusat kota Purwokerto. Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk.',
    ),
    Wisata(
      nama: 'Curug Cipendok',
      imageUrl:
          'https://asset.kompas.com/crops/nQc19AxCefdZKd3I-yyB7kuo3OI=/93x0:1084x660/750x500/data/photo/2023/10/06/652015ff5ee6e.jpg',
      deskripsi:
          'Curug Cipendok menawarkan pemandangan air terjun yang indah dengan suasana yang alami dan asri. Tempat ini cocok untuk melepas penat dari kesibukan kota.',
    ),
    Wisata(
      nama: 'Telaga Sunyi',
      imageUrl:
          'https://visitjawatengah.jatengprov.go.id/assets/images/730c64c2-1e01-41d2-8e4a-36e813e98252.jpg',
      deskripsi:
          'Telaga Sunyi adalah tempat yang sempurna untuk relaksasi dan menikmati keindahan alam. Airnya yang jernih dan suasananya yang tenang membuat tempat ini layak dikunjungi.',
    ),
    Wisata(
      nama: 'Pancuran Pitu',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz3t7M4WeH-0fSw8TGW60holzH9_bnEh42Xg&s',
      deskripsi:
          'Pancuran Pitu adalah tempat wisata pemandian air panas alami yang terletak di kawasan Baturaden. Tempat ini dipercaya memiliki khasiat untuk kesehatan kulit.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Rekomendasi Wisata Banyumas'),
              background: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR40TtLzRhv4wKKgYNFe1wjcXnath1X09eGTw&s',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final wisata = wisataList[index];
                return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          wisata.nama,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 8),
                        Image.network(
                          wisata.imageUrl,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          wisata.deskripsi,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Kunjungi ${wisata.nama} Sekarang!')),
                            );
                          },
                          child: Text('Kunjungi ${wisata.nama}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: wisataList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Wisata {
  final String nama;
  final String imageUrl;
  final String deskripsi;

  Wisata({required this.nama, required this.imageUrl, required this.deskripsi});
}
