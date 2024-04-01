import '../../src.export.dart';

class GetItUtils {
  static UserData user = getIt.get<UserData>();
  static CacheHelper prefs = getIt.get<CacheHelper>();
  static SecureSharedPref secPrefs = getIt.get<SecureSharedPref>();
  static ContactInfoService contactInfo = getIt.get<ContactInfoService>();
  static EditProduct editProduct = getIt.get<EditProduct>();
}
