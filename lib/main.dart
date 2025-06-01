//import 'package:daakesh/src/services/firebase/firebase_options.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:daakesh/src/core/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/src.export.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.immobilizeDeviceOrientation;
  await Firebase.initializeApp();
  await FirebaseMessagingService.initialize();
  configureDependencies(env: ValueConstants.dev);
  runApp(const AppWidget());
  //runApp(DevicePreview(builder: (BuildContext context) => const AppWidget()));
  Bloc.observer = MyBlocObserver();
}
