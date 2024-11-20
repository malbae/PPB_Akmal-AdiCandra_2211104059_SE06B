import 'package:flutter/material.dart';

class MahasiswaCard extends StatelessWidget {
  final Map<String, dynamic> data;

  MahasiswaCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(data['nama']),
        subtitle: Text(
            'NIM: ${data['nim']}\nAlamat: ${data['alamat']}\nHobi: ${data['hobi']}'),
      ),
    );
  }
}
