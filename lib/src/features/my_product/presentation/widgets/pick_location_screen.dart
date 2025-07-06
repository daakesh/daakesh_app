import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io' show Platform;

class PickLocationScreen extends StatefulWidget {
  final Function(double latitude, double longitude) onSelectPosition;
  const PickLocationScreen({super.key, required this.onSelectPosition});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  LatLng? selectedLatLng;
  GoogleMapController? _mapController;
  bool _isMapLoading = false;
  String _errorMessage = '';
  bool _isAndroidLegacy = false;

  @override
  void initState() {
    super.initState();
    _checkAndroidVersion();
    _determinePosition(); // Automatically get location when screen opens
  }

  void _checkAndroidVersion() {
    if (Platform.isAndroid) {
      // You can add version checking logic here if needed
      // For now, we'll handle all Android versions uniformly
      _isAndroidLegacy = false;
    }
  }

  final LatLng _initialLatLng =
      const LatLng(31.963158, 35.930359); // Default Amman

  Future<void> _determinePosition() async {
    setState(() {
      _isMapLoading = true;
      _errorMessage = '';
    });

    // Check network connectivity
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _errorMessage = 'No internet connection. Please check your network.';
        _isMapLoading = false;
      });
      return;
    }

    try {
      LocationPermission permission;
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _errorMessage = 'Location services are disabled.';
          _isMapLoading = false;
        });
        await Geolocator.openLocationSettings();
        return;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.always &&
            permission != LocationPermission.whileInUse) {
          setState(() {
            _errorMessage = 'Location permissions are denied.';
            _isMapLoading = false;
          });
          return;
        }
      }
      final position = await Geolocator.getCurrentPosition();
      final newLatLng = LatLng(position.latitude, position.longitude);
      setState(() {
        selectedLatLng = newLatLng;
        _isMapLoading = false;
      });
      if (_mapController != null) {
        await _mapController!.animateCamera(
          CameraUpdate.newLatLng(newLatLng),
        );
      }
      widget.onSelectPosition(position.latitude, position.longitude);
      print('✅ Location found: ${position.latitude}, ${position.longitude}');
    } catch (e) {
      setState(() {
        _errorMessage = 'Error getting location: $e';
        _isMapLoading = false;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Location')),
      body: Stack(
        children: [
          // Show loading indicator while getting location
          if (_isMapLoading)
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading map...'),
                  ],
                ),
              ),
            ),

          // Show error message if any
          if (_errorMessage.isNotEmpty && !_isMapLoading)
            Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 64),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _determinePosition,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          // Google Map
          if (!_isMapLoading && _errorMessage.isEmpty)
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              compassEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              zoomGesturesEnabled: true,
              buildingsEnabled: true,
              trafficEnabled: false,
              mapToolbarEnabled: false,
              // Add padding for older devices
              padding: const EdgeInsets.all(0),
              // Ensure compatibility with older Android versions
              liteModeEnabled: _isAndroidLegacy,
              onMapCreated: (controller) {
                _mapController = controller;
                print('✅ Google Map created successfully');

                // Set map style for better visibility on older devices
                if (_isAndroidLegacy) {
                  print('📱 Running on legacy Android, using lite mode');
                }

                // If we already have a location, animate to it
                if (selectedLatLng != null) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    _mapController?.animateCamera(
                      CameraUpdate.newLatLng(selectedLatLng!),
                    );
                  });
                }
              },
              initialCameraPosition:
                  CameraPosition(target: _initialLatLng, zoom: 14),
              markers: selectedLatLng != null
                  ? {
                      Marker(
                        markerId: const MarkerId('selected'),
                        position: selectedLatLng!,
                        draggable: true,
                        onDragEnd: (LatLng newPosition) {
                          setState(() {
                            selectedLatLng = newPosition;
                          });
                        },
                      ),
                    }
                  : {},
              onTap: (LatLng position) {
                setState(() {
                  selectedLatLng = position;
                  widget.onSelectPosition(
                      position.latitude, position.longitude);
                });
              },
            ),

          // Buttons on bottom
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button: Center on current location
                FloatingActionButton(
                  heroTag: 'location',
                  onPressed: _determinePosition,
                  child: const Icon(Icons.my_location),
                ),

                // Button: Confirm selected location
                FloatingActionButton(
                  heroTag: 'confirm',
                  onPressed: () {
                    if (selectedLatLng != null) {
                      Navigator.pop(context, selectedLatLng);
                      widget.onSelectPosition(
                        selectedLatLng!.latitude,
                        selectedLatLng!.longitude,
                      );
                    }
                  },
                  child: const Icon(Icons.check),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
