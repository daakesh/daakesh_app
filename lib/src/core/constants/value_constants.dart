import 'package:injectable/injectable.dart';

import '../../src.export.dart';

class ValueConstants {
  static const dev = Environment('dev');
  static const test = Environment('test');
  static String token = getIt.get<CacheHelper>().getData('token') ?? '';


}