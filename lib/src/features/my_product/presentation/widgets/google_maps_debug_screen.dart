import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsDebugScreen extends StatefulWidget {
  const GoogleMapsDebugScreen({super.key});

  @override
  State<GoogleMapsDebugScreen> createState() => _GoogleMapsDebugScreenState();
}

class _GoogleMapsDebugScreenState extends State<GoogleMapsDebugScreen> {
  GoogleMapController? _mapController;
  bool _isMapCreated = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Debug'),
        backgroundColor: Colors.red.shade100,
      ),
      body: Column(
        children: [
          // Status indicators
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Map Status: ${_isMapCreated ? "✅ Created" : "❌ Not Created"}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (_errorMessage.isNotEmpty)
                  Text(
                    'Error: $_errorMessage',
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 8),
                const Text(
                  'If you see a white screen below, check:\n'
                  '1. Google Maps API key is valid\n'
                  '2. Maps SDK for Android/iOS is enabled\n'
                  '3. Billing is enabled on Google Cloud',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),

          // Google Map
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _mapController = controller;
                    _isMapCreated = true;
                  });
                  print('✅ Google Map created successfully');
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(31.963158, 35.930359), // Amman, Jordan
                  zoom: 10.0,
                ),
                onTap: (LatLng position) {
                  print(
                      'Map tapped at: ${position.latitude}, ${position.longitude}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Tapped: ${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
          ),

          // Test buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_mapController != null) {
                      try {
                        await _mapController!.animateCamera(
                          CameraUpdate.newLatLngZoom(
                            const LatLng(31.963158, 35.930359), // Amman
                            15.0,
                          ),
                        );
                        print('✅ Camera moved to Amman');
                      } catch (e) {
                        setState(() {
                          _errorMessage = 'Camera error: $e';
                        });
                        print('❌ Camera error: $e');
                      }
                    }
                  },
                  child: const Text('Test Camera'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
