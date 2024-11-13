import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: ImagePickerApp(),
  ));
}

class ImagePickerApp extends StatefulWidget {
  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? _image; // Menyimpan gambar yang dipilih atau diambil

  final ImagePicker _picker = ImagePicker(); // Inisialisasi ImagePicker

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Mengupdate gambar dalam state
      });
    }
  }

  // Fungsi untuk mengambil gambar menggunakan kamera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Mengupdate gambar dalam state
      });
    }
  }

  // Fungsi untuk menghapus gambar
  void _deleteImage() {
    setState(() {
      _image = null; // Menghapus gambar dari state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menampilkan gambar yang dipilih atau diambil
            _image == null
                ? Text('Tidak ada gambar yang dipilih.')
                : Image.file(_image!),

            SizedBox(height: 20),

            // Tombol untuk memilih gambar dari galeri
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: Text('Pilih Gambar dari Galeri'),
            ),

            // Tombol untuk mengambil gambar menggunakan kamera
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: Text('Ambil Gambar dengan Kamera'),
            ),

            // Tombol untuk menghapus gambar
            ElevatedButton(
              onPressed: _deleteImage,
              child: Text('Hapus Gambar'),
            ),
          ],
        ),
      ),
    );
  }
}
