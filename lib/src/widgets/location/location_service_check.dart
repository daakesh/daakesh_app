import 'dart:convert';
import 'dart:io';

import 'package:daakesh/src/src.export.dart';
import 'package:daakesh/src/widgets/custom_message_dialog.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';

class LocationServiceWidget extends StatefulWidget {
  final Widget child;
  final Function(double lat, double long) returnPosition;

  final bool showLocationDialog;

  const LocationServiceWidget({
    Key? key,
    required this.child,
    this.showLocationDialog = false,
    required this.returnPosition,
  }) : super(key: key);

  @override
  State<LocationServiceWidget> createState() => _LocationServiceWidgetState();
}

class _LocationServiceWidgetState extends State<LocationServiceWidget> {
  @override
  void initState() {
    super.initState();
    checkLocationRequirements();
  }

  Future<void> checkLocationRequirements() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    debugPrint(
        'isLocationServiceEnabled :: : : : : : :    $isLocationServiceEnabled');

    debugPrint('permission :: : : : : : :    $permission');

    if (!isLocationServiceEnabled) {
      if (widget.showLocationDialog) {
        _showLocationServiceDialog();
      } else {
        if (Platform.isIOS) {
          _openLocationServices();
        } else if (Platform.isAndroid) {
          await Geolocator.openLocationSettings();
        }
      }
    } else {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        await _getCurrentPositionF(context);
      } else if (permission == LocationPermission.deniedForever) {
        _showLocationPermissionDialog(permission);
      } else {
        permission = await Geolocator.requestPermission();
      }
    }
  }

  Future<void> _openLocationServices() async {
    OpenSettingsPlusIOS settings = const OpenSettingsPlusIOS();
    try {
      settings.locationServices();
    } catch (e) {
      debugPrint("Failed to open location services: $e");
    }
  }

  void _showLocationServiceDialog() {
    showMessageDialog(
      context: context,
      removeCloseButton: true,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location Services Disabled',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            const Text(
              'Location Services Are Disabled Please',
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 70,
                  child: SizedBox(
                      height: 45,
                      child: DefaultButtonWidget(
                        onPressed: () async {
                          if (Platform.isIOS) {
                            await _openLocationServices();

                            Navigator.pop(context);
                          } else if (Platform.isAndroid) {
                            await Geolocator.openLocationSettings();

                            Navigator.pop(context);
                          }
                        },
                        text: 'Enable Location Services',
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLocationPermissionDialog(LocationPermission permission) {
    showMessageDialog(
      context: context,
      removeCloseButton: true,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LocationPermissionDenied',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            Text(
              permission == LocationPermission.deniedForever ||
                      permission == LocationPermission.denied
                  ? 'locationAccessIsPermanentlyDenied'
                  : 'locationAccessIsDenied',
              style: const TextStyle(
                fontSize: 11,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 70,
                  child: SizedBox(
                    height: 35,
                    child: DefaultButtonWidget(
                      text: permission == LocationPermission.deniedForever ||
                              permission == LocationPermission.denied
                          ? 'Enable In Settings'
                          : 'Allow Permission',
                      onPressed: () async {
                        await Geolocator.openAppSettings();

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 30,
                  child: SizedBox(
                    height: 35,
                    child: DefaultButtonWidget(
                      text: 'close',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentPositionF(BuildContext context) async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      debugPrint(
          'your position::     ${position.longitude}    ${position.latitude}');
      widget.returnPosition(position.latitude, position.longitude);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
