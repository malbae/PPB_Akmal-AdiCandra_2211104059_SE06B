{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 import 'package:flutter/material.dart';\
import '../db/db_helper.dart';\
\
class MyDbView extends StatefulWidget \{\
  const MyDbView(\{Key? key\}) : super(key: key);\
\
  @override\
  _MyDbViewState createState() => _MyDbViewState();\
\}\
\
class _MyDbViewState extends State<MyDbView> \{\
  final DatabaseHelper _dbHelper = DatabaseHelper();\
  final TextEditingController _titleController = TextEditingController();\
  final TextEditingController _descriptionController = TextEditingController();\
\
  List<Map<String, dynamic>> _dataList = [];\
\
  // Method untuk mengambil data dari database\
  void _refreshData() async \{\
    final data = await _dbHelper.queryAllRows();\
    setState(() \{\
      _dataList = data;\
    \});\
  \}\
\
  // Method untuk menyimpan data ke database\
  Future<void> _saveData() async \{\
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) \{\
      await _dbHelper.insert(\{\
        'title': _titleController.text,\
        'description': _descriptionController.text,\
      \});\
      _titleController.clear();\
      _descriptionController.clear();\
      _refreshData(); // Refresh data setelah menyimpan\
    \}\
  \}\
\
  @override\
  void initState() \{\
    super.initState();\
    _refreshData(); // Ambil data saat widget diinisialisasi\
  \}\
\
  @override\
  Widget build(BuildContext context) \{\
    return Scaffold(\
      appBar: AppBar(\
        title: const Text('Database Viewer'),\
      ),\
      body: Padding(\
        padding: const EdgeInsets.all(16.0),\
        child: Column(\
          children: [\
            // Input Form\
            TextField(\
              controller: _titleController,\
              decoration: const InputDecoration(labelText: 'Title'),\
            ),\
            TextField(\
              controller: _descriptionController,\
              decoration: const InputDecoration(labelText: 'Description'),\
            ),\
            const SizedBox(height: 16),\
            ElevatedButton(\
              onPressed: _saveData,\
              child: const Text('Save Data'),\
            ),\
            const SizedBox(height: 16),\
            // Display Data\
            Expanded(\
              child: _dataList.isEmpty\
                  ? const Center(child: Text('No data found.'))\
                  : ListView.builder(\
                      itemCount: _dataList.length,\
                      itemBuilder: (context, index) \{\
                        final item = _dataList[index];\
                        return Card(\
                          margin: const EdgeInsets.symmetric(vertical: 8),\
                          child: ListTile(\
                            title: Text(item['title']),\
                            subtitle: Text(item['description']),\
                          ),\
                        );\
                      \},\
                    ),\
            ),\
          ],\
        ),\
      ),\
    );\
  \}\
\}\
}