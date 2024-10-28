import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyWisata());
}

class MyWisata extends StatelessWidget {
  const MyWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar User Interaction',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(title: 'Beranda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final TextStyle optionStyle = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            child: Text(
              'FORM LOGIN',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            obscureText: false,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.person),
              hintText: "Masukan Username",
              hintStyle: GoogleFonts.poppins(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.lock),
              hintText: "Masukan Password",
              hintStyle: GoogleFonts.poppins(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[400],
              foregroundColor: Colors.black,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(120.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Login",
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Text('Ini Halaman Wisata', style: optionStyle),
    ),
    Center(
      child: Text('Ini Halaman Profile', style: optionStyle),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
