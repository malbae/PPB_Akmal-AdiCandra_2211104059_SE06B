import 'package:flutter/material.dart';
import '../db/db_helper.dart';

class MyDbView extends StatefulWidget {
  const MyDbView({Key? key}) : super(key: key);

  @override
  _MyDbViewState createState() => _MyDbViewState();
}

class _MyDbViewState extends State<MyDbView> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> _dataList = [];
  int? _selectedId;

  // Method untuk mengambil data dari database
  void _refreshData() async {
    final data = await _dbHelper.queryAllRows();
    setState(() {
      _dataList = data;
      _selectedId = null; // Reset ID yang dipilih
    });
  }

  // Method untuk menyimpan data ke database
  Future<void> _addData() async {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      await _dbHelper.insert({
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      _titleController.clear();
      _descriptionController.clear();
      _refreshData(); // Refresh data setelah menyimpan
    }
  }

  // Method untuk memperbarui data di database
  Future<void> _updateData() async {
    if (_selectedId != null &&
        _titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      await _dbHelper.update({
        'id': _selectedId, // ID yang dipilih untuk diperbarui
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      _titleController.clear();
      _descriptionController.clear();
      _refreshData(); // Refresh data setelah memperbarui
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Ambil data saat widget diinisialisasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Viewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Form
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedId == null ? _addData : _updateData,
              child: Text(_selectedId == null ? 'Save Data' : 'Update Data'),
            ),
            const SizedBox(height: 16),
            // Display Data
            Expanded(
              child: _dataList.isEmpty
                  ? const Center(child: Text('No data found.'))
                  : ListView.builder(
                      itemCount: _dataList.length,
                      itemBuilder: (context, index) {
                        final item = _dataList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(item['title']),
                            subtitle: Text(item['description']),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  _selectedId = item['id']; // Set ID untuk update
                                  _titleController.text = item['title'];
                                  _descriptionController.text = item['description'];
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
