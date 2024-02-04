import 'package:flutter/material.dart';
import 'src/src.export.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(env: ValueConstants.dev);
  runApp(const AppWidget());
}