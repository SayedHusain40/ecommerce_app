class UserNullException implements Exception {
  final String message;
  UserNullException(this.message);
}
class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}
