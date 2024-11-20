import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../widgets/mahasiswa_card.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _mahasiswaList = [];

  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _mahasiswaList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: _mahasiswaList.length,
        itemBuilder: (context, index) {
          return MahasiswaCard(data: _mahasiswaList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
          _refreshData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
