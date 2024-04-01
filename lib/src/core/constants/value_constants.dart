import 'package:injectable/injectable.dart';

import '../../src.export.dart';

class ValueConstants {
  static const dev = Environment('dev');
  static const test = Environment('test');
  static String token = GetItUtils.prefs.getData(SharedPrefKeys.token) ?? '';
  static String userId = GetItUtils.prefs.getData(SharedPrefKeys.userID) ?? '';
}
