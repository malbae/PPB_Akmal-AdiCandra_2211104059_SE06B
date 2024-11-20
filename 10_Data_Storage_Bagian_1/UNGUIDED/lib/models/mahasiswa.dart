class Mahasiswa {
  final int? id;
  final String nama;
  final String nim;
  final String alamat;
  final String hobi;

  Mahasiswa(
      {this.id,
      required this.nama,
      required this.nim,
      required this.alamat,
      required this.hobi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }
}
