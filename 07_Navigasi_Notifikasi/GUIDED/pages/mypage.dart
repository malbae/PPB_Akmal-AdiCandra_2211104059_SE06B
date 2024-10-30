import 'package:flutter/material.dart';
import 'package:pertemuan72/models/product.dart';
import 'package:pertemuan72/pages/detailpage.dart';
import 'package:pertemuan72/main.dart'; // Import main.dart untuk akses showNotification

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: "Mouse",
      harga: 300000.00,
      gambarUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      deskripsi: 'Mouse Gaming cakep',
    ),
    Product(
      id: 2,
      nama: "Keyboard Mechanical",
      harga: 500000.00,
      gambarUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1',
      deskripsi: 'Keyboard mechanical cakep',
    ),
    Product(
      id: 3,
      nama: "Headphone Gaming",
      harga: 450000.00,
      gambarUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
      deskripsi: 'Headphone cakep',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class Model"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.gambarUrl,
              width: 70,
              height: 70,
            ),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rp${product.harga}'),
                Text('Deskripsi: ${product.deskripsi}'),
              ],
            ),
            onTap: () {
              // Memanggil notifikasi saat item diklik
              showNotification(product.nama, "Harga: Rp${product.harga}");

              // Navigasi ke DetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    data: Text(product.nama),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
