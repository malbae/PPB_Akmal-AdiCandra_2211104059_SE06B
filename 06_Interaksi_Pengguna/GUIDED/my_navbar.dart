import 'package:flutter/material.dart';
import 'package:pertemuan62/my_tabbar.dart';
import 'package:pertemuan62/my_package.dart'; // Import MyPackage if needed

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex =
      0; // Corrected variable name to match standard convention

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index; // Corrected syntax within setState
    });
  }

  List<Widget> _pages = <Widget>[
    // Corrected widget to Widget (capitalized)
    MyTabbar(),
    MyPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex], // Displays the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_rounded), label: "My TabBar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.adb_rounded), label: "My Package 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_rounded), label: "My Package 2"),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        selectedFontSize: 20,
      ),
    );
  }
}
