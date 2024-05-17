import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  AppSecureStorage._();

  static final instance = AppSecureStorage._();
  static const String _kToken = 'TOKEN';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Future<void> storeToken(String token) async {
    await _storage.write(key: _kToken, value: token);
  }

  Future<String?>? getToken() async {
    return await _storage.read(key: _kToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _kToken);
  }
}
