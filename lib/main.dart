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







///1-skip two login screen ==> Done.
///
///3-swap item location in arabic need space. ==> Done.
///
///5-cannot go to shop page after do swap. ==> Done.
///
///7-search my item message not exist in arabic. == Done.
///
///
///2-new password able in account details. ==> Don't understand.
///
///4-gray screen in vape juice in swap. ==> There is no gray screen.
///
///6-menu not clickable after do swap. ==> Don't understand.
///
///8-search my item get duplicate. ==> after delete my item should delete from SearchUserItems service.
///
///9-search my item in swap ans sell is the same ==> I already pass type but it ain't work, Should filter from backend. 