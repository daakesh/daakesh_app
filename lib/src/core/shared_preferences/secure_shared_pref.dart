import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureSharedPref {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
}

@Singleton(as: SecureSharedPref)
class ImplSecureSharedPref implements SecureSharedPref {
  FlutterSecureStorage? storage;
  ImplSecureSharedPref() {
    inti();
  }

  void inti() {
    storage = const FlutterSecureStorage();
  }

  @override
  Future<void> write(String key, String value) async {
    await storage!.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await storage!.read(key: key);
  }
}
