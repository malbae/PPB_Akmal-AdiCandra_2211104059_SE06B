import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleMapScreen(),
    );
  }
}

class GoogleMapScreen extends StatelessWidget {
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-6.917464, 107.619123), // Lokasi awal di Bandung
    zoom: 14.0, // Tingkat pembesaran awal
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Example'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
      ),
    );
  }
}
