import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_test/shared/secure_store/session_storage.dart';

class SecureStorage extends SessionStorage {
  final FlutterSecureStorage storage;

  SecureStorage({required this.storage});

  @override
  Future<void> clearData() {
    return storage.deleteAll();
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    final data = await storage.read(key: key);
    return jsonDecode(data);
  }

  Future<bool> contains(String key) async {
    return storage.containsKey(key: key);
  }

  @override
  Future<void> set(String key, Map<String, dynamic> data) {
    return storage.write(key: key, value: jsonEncode(data));
  }
}