import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlacePickerExample(),
    );
  }
}

class PlacePickerExample extends StatelessWidget {
  final String googleApiKey = "AIzaSyD-EXAMPLE1234567890qwertyuiopasdfghjk";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Picker Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Tampilkan Place Picker
            LocationResult result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlacePicker(googleApiKey),
              ),
            );

            // Cek jika lokasi dipilih
            if (result != null) {
              print("Latitude: ${result.latLng?.latitude}");
              print("Longitude: ${result.latLng?.longitude}");
            } else {
              print("No location selected");
            }
          },
          child: Text("Pick a Place"),
        ),
      ),
    );
  }
}
