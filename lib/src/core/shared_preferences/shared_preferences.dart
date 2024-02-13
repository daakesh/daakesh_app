import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src.export.dart';

final prefs = getIt.get<CacheHelper>();

abstract class CacheHelper{
  dynamic getData(String key);
  Future<bool> setString(String key,String value);
  Future<bool> setInt(String key,int value);
  Future<bool> setBool(String key,bool value);
  Future<bool> setDouble(String key,double value);
  Future<bool> removeData(String key);
}


@Singleton(as: CacheHelper)
class CacheHelperImpl implements CacheHelper{
   SharedPreferences? sharedPreferences;
   CacheHelperImpl(){
     init();
   }

   Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   @override
   dynamic getData(String key) {
    return sharedPreferences!.get(key);
  }

   @override
   Future<bool> setString(
      String key,
      String value,
   ) async {
     return await sharedPreferences!.setString(key,value);
   }

   @override
   Future<bool> setInt(
     String key,
     int value,
   ) async {
     return await sharedPreferences!.setInt(key,value);
   }

   @override
   Future<bool> setBool(
     String key,
     bool value,
   ) async {
     return await sharedPreferences!.setBool(key, value);
   }

   @override
   Future<bool> setDouble(
     String key,
     double value,
   ) async {
     return await sharedPreferences!.setDouble(key,value);
   }

   @override
   Future<bool> removeData(
    String key,
  ) async {
    return await sharedPreferences!.remove(key);
  }
}