import 'package:flutter/material.dart';
import 'package:praktikum/models/product.dart';
import 'package:praktikum/pages/detailpage.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Air Slamet',
      description: 'Air yang berasal dari gunung slamet',
      price: 10000,
      imageUrl:
          'https://tastysnack.id/cdn/shop/files/CRYSTALINAIRMINERALBTL600mL_1024x.jpg?v=1704773917',
    ),
    Product(
      id: '2',
      name: 'Air Janah',
      description: 'Air dari pegunungan Evresh',
      price: 4000,
      imageUrl:
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-3759227/aqua_air-mineral-aqua-600-ml-botol_full02.jpg',
    ),
    // Tambahkan lebih banyak produk jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Daftar Produk')),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Rp${product.price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
