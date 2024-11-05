import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang')),
      body: Center(
        child: Text('Belum ada produk di keranjang'),
      ),
    );
  }
}
