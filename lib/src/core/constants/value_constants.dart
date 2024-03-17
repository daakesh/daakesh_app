import 'package:injectable/injectable.dart';

import '../../src.export.dart';

class ValueConstants {
  static const dev = Environment('dev');
  static const test = Environment('test');
  static String token = prefs.getData('token') ?? '';
  static String userId = prefs.getData('userId') ?? '';
  static String language = prefs.getData('lang') ?? 'en';


}