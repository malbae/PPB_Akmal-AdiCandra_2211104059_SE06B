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

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-6.917464, 107.619123), // Bandung, Indonesia
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Example'),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType:
            MapType.normal, // normal, satellite, hybrid, terrain
        onMapCreated: (GoogleMapController controller) {
          print('Google Map is ready');
        },
      ),
    );
  }
}
