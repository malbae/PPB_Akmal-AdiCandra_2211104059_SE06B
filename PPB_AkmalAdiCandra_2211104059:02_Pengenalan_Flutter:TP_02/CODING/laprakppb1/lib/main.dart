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
  // Fungsi untuk menampilkan Snackbar
  void showBiodataSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
            // Widget 1: Nama sebagai tombol
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: TextButton(
                  onPressed: () {
                    showBiodataSnackBar(context, 'Nama: Akmal AdiCandra');
                  },
                  child: Text(
                    'Nama: Akmal AdiCandra',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text('Menampilkan nama sebagai tombol yang bisa diklik.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 2: NIM sebagai tombol
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.badge, color: Colors.green),
                title: TextButton(
                  onPressed: () {
                    showBiodataSnackBar(context, 'NIM: 2211104059');
                  },
                  child: Text(
                    'NIM: 2211104059',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text('Menampilkan NIM sebagai tombol yang bisa diklik.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 3: Program Studi sebagai tombol
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.orange),
                title: TextButton(
                  onPressed: () {
                    showBiodataSnackBar(
                        context, 'Program Studi: Rekayasa Perangkat Lunak');
                  },
                  child: Text(
                    'Program Studi: Rekayasa Perangkat Lunak',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                    'Menampilkan Program Studi sebagai tombol yang bisa diklik.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 4: Alamat sebagai tombol
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.red),
                title: TextButton(
                  onPressed: () {
                    showBiodataSnackBar(context, 'Alamat: Jalan Tanjlig');
                  },
                  child: Text(
                    'Alamat: Jalan Tanjlig',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text('Menampilkan alamat sebagai tombol yang bisa diklik.'),
              ),
            ),
            SizedBox(height: 10),

            // Widget 5: Hobi sebagai tombol
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.sports_soccer, color: Colors.purple),
                title: TextButton(
                  onPressed: () {
                    showBiodataSnackBar(context, 'Hobi: Main Johnson Mid');
                  },
                  child: Text(
                    'Hobi: Main Johnson Mid',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text('Menampilkan hobi sebagai tombol yang bisa diklik.'),
              ),
            ),
            SizedBox(height: 20),

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

            // Widget 7: Switch dengan style (Tidak diubah)
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
