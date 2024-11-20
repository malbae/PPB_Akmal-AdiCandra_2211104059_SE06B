{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 import 'package:sqflite/sqflite.dart';\
import 'package:path/path.dart';\
\
class DatabaseHelper \{\
  static final DatabaseHelper _instance = DatabaseHelper._internal();\
  static Database? _database;\
\
  factory DatabaseHelper() => _instance;\
\
  DatabaseHelper._internal();\
\
  Future<Database> get database async \{\
    if (_database != null) return _database!;\
    _database = await _initDatabase();\
    return _database!;\
  \}\
\
  Future<Database> _initDatabase() async \{\
    String path = join(await getDatabasesPath(), 'my_prakdatabase.db');\
    return await openDatabase(\
      path,\
      version: 1,\
      onCreate: _onCreate,\
    );\
  \}\
\
  Future<void> _onCreate(Database db, int version) async \{\
    await db.execute('''\
      CREATE TABLE my_table (\
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,\
        title TEXT,\
        description TEXT,\
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP\
      )\
    ''');\
  \}\
\
  Future<int> insert(Map<String, dynamic> row) async \{\
    Database db = await database;\
    return await db.insert('my_table', row);\
  \}\
\
  Future<List<Map<String, dynamic>>> queryAllRows() async \{\
    Database db = await database;\
    return await db.query('my_table');\
  \}\
\
  Future<int> update(Map<String, dynamic> row) async \{\
    Database db = await database;\
    int id = row['id'];\
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);\
  \}\
\
  Future<int> delete(int id) async \{\
    Database db = await database;\
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);\
  \}\
\}\
}