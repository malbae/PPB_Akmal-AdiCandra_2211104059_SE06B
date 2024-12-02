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
  static const LatLng _markerPosition = LatLng(-6.2088, 106.8456); // Jakarta
  static const CameraPosition _initialPosition = CameraPosition(
    target: _markerPosition,
    zoom: 14.0,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: MarkerId('marker_1'),
        position: _markerPosition,
        infoWindow:
            InfoWindow(title: 'Jakarta', snippet: 'Capital of Indonesia'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with Marker'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        markers: _markers,
      ),
    );
  }
}
