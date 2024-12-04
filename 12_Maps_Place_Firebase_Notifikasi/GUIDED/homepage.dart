import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/place_picker.dart';

class MyMaps extends StatefulWidget {
  const MyMaps({super.key});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static const LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  // Set marker
  Set<Marker> _createMarker() {
    return {
      const Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        infoWindow: InfoWindow(title: 'Marker 1'),
        rotation: 90,
      ),
      const Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-6.9733165, 107.6281415),
        infoWindow: InfoWindow(title: 'Marker 2'),
      ),
    };
  }

  // Show Place Picker
  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PlacePicker(
        "AIzaSyB3q0WTwH3yT1Jhg3neUB4pKE-J9c4hcw4I",
        displayLocation: _kMapCenter,
      ),
    ));

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: showPlacePicker,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueAccent,
              child: const Text(
                'Pick a Place',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              myLocationEnabled: true,
              markers: _createMarker(),
            ),
          ),
        ],
      ),
    );
  }
}
