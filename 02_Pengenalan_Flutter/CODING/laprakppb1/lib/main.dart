import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7 Widgets Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LAPRAK 2211104059'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Widget 1: Card dengan Text
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.text_fields, color: Colors.blue),
                title: Text(
                  'Widget 1: Ini adalah widget Text',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Menampilkan teks biasa.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 2: ElevatedButton dengan style
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.touch_app, color: Colors.green),
                title: ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol ditekan
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ElevatedButton ditekan!')));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Widget 2: Tekan saya!'),
                ),
                subtitle: Text('Tombol dengan aksi Snackbar.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 3: Image dengan border radius
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.image, color: Colors.red),
                title: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2023/03/09/dongeng-anak-bebek-bebek-mendon-20230309052944.jpg',
                    height: 100,
                  ),
                ),
                subtitle: Text('Widget 3: Gambar dari URL.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 4: Icon dengan deskripsi
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.orange),
                title: Text(
                  'Widget 4: Ikon Bintang',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Menampilkan ikon bintang dengan warna oranye.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 5: Container dengan style
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.crop_square, color: Colors.purple),
                title: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Widget 5: Kotak Biru',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                subtitle: Text(
                    'Container dengan latar belakang biru dan teks putih.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 6: Checkbox dengan style
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.check_box, color: Colors.teal),
                title: Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                      activeColor: Colors.teal,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text('Widget 6: Checkbox yang dipilih'),
                    ),
                  ],
                ),
                subtitle: Text('Kotak centang yang dipilih.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 7: Switch dengan style
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.toggle_on, color: Colors.blue),
                title: Row(
                  children: [
                    Switch(
                      value: true,
                      onChanged: (bool value) {},
                      activeColor: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text('Widget 7: Switch Aktif'),
                    ),
                  ],
                ),
                subtitle: Text('Tombol sakelar yang aktif.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
