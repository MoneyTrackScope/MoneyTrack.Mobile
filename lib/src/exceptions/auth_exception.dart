class AuthException implements Exception{
  final String message;
  const AuthException(this.message);
  String get getMessage => message;
  @override
  String toString() => 'AuthException: $message';
}