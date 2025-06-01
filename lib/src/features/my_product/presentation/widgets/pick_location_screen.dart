import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class PickLocationScreen extends StatefulWidget {
  final Function(double latitude, double longitude) onSelectPosition;
  const PickLocationScreen({super.key, required this.onSelectPosition});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  LatLng? selectedLatLng;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  LatLng _initialLatLng = const LatLng(31.963158, 35.930359); // Default Amman

  Future<void> _determinePosition() async {
    LocationPermission permission;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) return;
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _initialLatLng = LatLng(position.latitude, position.longitude);
      selectedLatLng = _initialLatLng;
    });

    _mapController?.animateCamera(CameraUpdate.newLatLng(_initialLatLng));
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Location')),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => _mapController = controller,
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
                widget.onSelectPosition(position.latitude, position.longitude);
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
