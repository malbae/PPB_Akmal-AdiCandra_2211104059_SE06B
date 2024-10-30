class Product {
  final int id;
  final String nama;
  final double harga;
  final String gambarUrl;
  final String deskripsi;

  // Constructor
  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambarUrl,
    required this.deskripsi,
  });

  // Method untuk mengonversi Json => Object Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      gambarUrl: json['gambarUrl'],
      deskripsi: json['deskripsi'],
    );
  }

  // Method untuk mengonversi Object Product => Json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "harga": harga,
      "gambarUrl": gambarUrl,
      "deskripsi": deskripsi,
    };
  }
}
