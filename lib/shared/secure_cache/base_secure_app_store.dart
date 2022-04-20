abstract class ISecureAppStore {
  Future<bool> getAuthToken();
  Future<Map<String, dynamic>> getToken(String token);
  Future<void> setAuthToken(String key, Map<String, dynamic> data);
  Future<void> clearToken();
}