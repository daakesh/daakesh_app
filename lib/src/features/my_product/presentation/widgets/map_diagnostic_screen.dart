import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapDiagnosticScreen extends StatefulWidget {
  const MapDiagnosticScreen({super.key});

  @override
  State<MapDiagnosticScreen> createState() => _MapDiagnosticScreenState();
}

class _MapDiagnosticScreenState extends State<MapDiagnosticScreen> {
  GoogleMapController? _controller;
  bool _mapReady = false;
  String _status = 'Initializing...';
  final List<String> _logs = [];

  void _addLog(String message) {
    setState(() {
      _logs.add('${DateTime.now().toString().substring(11, 19)}: $message');
    });
    print('🔍 MAP DIAGNOSTIC: $message');
  }

  void _onMapCreated(GoogleMapController controller) {
    _addLog('✅ Map controller created');
    _controller = controller;
    setState(() {
      _mapReady = true;
      _status = 'Map Ready';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Diagnostic'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Status Card
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    _mapReady ? Icons.check_circle : Icons.hourglass_empty,
                    color: _mapReady ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Status: $_status',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Map View
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(31.963158, 35.930359), // Amman
                    zoom: 10,
                  ),
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  onTap: (LatLng position) {
                    _addLog(
                        '🎯 Map tapped at: ${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}');
                  },
                  markers: {
                    const Marker(
                      markerId: MarkerId('test'),
                      position: LatLng(31.963158, 35.930359),
                      infoWindow: InfoWindow(
                        title: 'Test Marker',
                        snippet: 'Amman, Jordan',
                      ),
                    ),
                  },
                ),
              ),
            ),
          ),

          // Logs
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Diagnostic Logs:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _logs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            _logs[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _logs.clear();
                    });
                    _addLog('🔄 Logs cleared');
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear Logs'),
                ),
                ElevatedButton.icon(
                  onPressed: _mapReady
                      ? () {
                          _controller?.animateCamera(
                            CameraUpdate.newLatLngZoom(
                              const LatLng(31.963158, 35.930359),
                              15.0,
                            ),
                          );
                          _addLog('📍 Camera moved to Amman');
                        }
                      : null,
                  icon: const Icon(Icons.my_location),
                  label: const Text('Test Camera'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addLog('🚀 Diagnostic screen initialized');
    _addLog('📱 Platform: ${Theme.of(context).platform}');
  }
}
