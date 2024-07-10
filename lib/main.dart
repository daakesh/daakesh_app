//import 'package:daakesh/src/services/firebase/firebase_options.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/src.export.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies(env: ValueConstants.dev);
  runApp(const AppWidget());
  //runApp(DevicePreview(builder: (BuildContext context) => const AppWidget()));
  Bloc.observer = MyBlocObserver();
}







/// profile code country into profile screen.
/// 
/// swap sell to general at complaint.
/// erase sell name.
/// remark == message in english and شكوى
/// 
/// reset the state of edit to make edit.
/// 
/// 