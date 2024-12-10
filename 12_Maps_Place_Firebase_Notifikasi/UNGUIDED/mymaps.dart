import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; // Untuk geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/place_picker.dart';

class MyMaps extends StatefulWidget {
  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static final LatLng _defaultLocation =
      LatLng(-6.200000, 106.816666); // Jakarta
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: _defaultLocation,
    zoom: 12.0,
  );

  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  String _selectedLocation = "Tap a marker to get location details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps & Place Picker'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onTap: _handleTap,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Text(
                    _selectedLocation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: showPlacePicker,
                  child: Text("Pilih Lokasi dengan Place Picker"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleTap(LatLng tappedPoint) async {
    // Tambahkan marker di lokasi yang dipilih
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
    });

    try {
      // Ambil detail lokasi berdasarkan koordinat
      List<Placemark> placemarks = await placemarkFromCoordinates(
        tappedPoint.latitude,
        tappedPoint.longitude,
      );

      print("Placemark data: $placemarks");

      // Pastikan placemarks tidak kosong
      setState(() {
        if (placemarks.isNotEmpty) {
          _selectedLocation =
              "${placemarks.first.name}, ${placemarks.first.locality}, ${placemarks.first.country}";
        } else {
          _selectedLocation = "No location found for these coordinates";
        }
      });
    } catch (e) {
      print("Error fetching location details: $e");
      // Jika terjadi error, tampilkan pesan
      setState(() {
        _selectedLocation = "Error fetching location details: $e";
      });
    }
  }

  Future<void> showPlacePicker() async {
    const String apiKey =
        "AIzaSyDMbGRLktQQCdaEPufDgOSdnjA_ExiWHVk"; // Ganti dengan API Key Anda

    try {
      // Gunakan Place Picker untuk memilih lokasi
      LocationResult? result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            apiKey,
            displayLocation: _defaultLocation,
          ),
        ),
      );

      print("PlacePicker result: $result");

      if (result == null || result.latLng == null) {
        setState(() {
          _selectedLocation = "No location selected";
        });
        return;
      }

      // Perbarui marker dan nama lokasi
      setState(() {
        _markers.clear();
        _markers.add(
          Marker(
            markerId: MarkerId(result.latLng.toString()),
            position: result.latLng!,
            infoWindow: InfoWindow(
              title: result.formattedAddress ?? "Lokasi Pilihan",
            ),
          ),
        );

        _mapController.animateCamera(
          CameraUpdate.newLatLng(result.latLng!),
        );

        // Tampilkan nama lokasi
        _selectedLocation = result.formattedAddress ?? "Unnamed location";
      });
    } catch (e) {
      print("Error using Place Picker: $e");
      // Jika terjadi error saat menggunakan Place Picker
      setState(() {
        _selectedLocation = "Error using Place Picker: $e";
      });
    }
  }
}
