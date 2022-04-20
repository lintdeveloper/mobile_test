import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_test/shared/secure_cache/base_secure_app_store.dart';
import 'package:mobile_test/shared/secure_store/session_storage_impl.dart';

class SecureCacheService extends ISecureAppStore {
  final SecureStorage _secureStorage;

  SecureCacheService.instance()
      : _secureStorage =  SecureStorage(
      storage: const FlutterSecureStorage()
  );

  @override
  Future<bool> getAuthToken() async {
    return await _secureStorage.contains("authToken");
  }

  @override
  Future<Map<String, dynamic>> getToken(String token) async {
    return await _secureStorage.get(token);
  }

  @override
  Future<void> setAuthToken(String key, Map<String, dynamic> data) {
    return _secureStorage.set(key, data);
  }

  @override
  Future<void> clearToken() {
    return _secureStorage.clearData();
  }
}