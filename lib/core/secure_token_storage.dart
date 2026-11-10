import 'package:easy_recipe/core/token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage implements TokenStorage {
  final FlutterSecureStorage _storage;
  const new({required this._storage});

  static const String tokenKey = 'token';

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: tokenKey);
  }
}
