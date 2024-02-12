class AuthException implements Exception {
  final String message;

  const AuthException({this.message = 'Authentication error'});

  @override
  String toString() => message;
}
