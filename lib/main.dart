import 'package:flutter/material.dart';
import 'src/src.export.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureDependencies(env: ValueConstants.dev);
  runApp(const AppWidget());
}