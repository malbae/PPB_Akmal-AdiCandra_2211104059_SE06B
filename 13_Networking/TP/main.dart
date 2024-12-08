import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel untuk menyimpan nilai counter
  var counter = 0.obs; // .obs membuat counter menjadi reaktif

  // Fungsi untuk menambah nilai counter
  void increment() {
    counter++;
  }

  // Fungsi untuk mereset nilai counter
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100, // Latar belakang yang cerah
      appBar: AppBar(
        title: Text("Counter App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.teal, // Warna app bar yang menarik
      ),
      body: Center(
        child: Obx(() {
          // Animasi dengan perubahan nilai counter
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Text(
              "${controller.counter}",
              key: ValueKey<int>(
                  controller.counter.value), // Key untuk animasi perubahan
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.increment(); // Menambah nilai counter
            },
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.green, // Warna tombol tambah
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              controller.reset(); // Mereset nilai counter
            },
            child: Icon(Icons.refresh, color: Colors.white),
            backgroundColor: Colors.red, // Warna tombol reset
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
