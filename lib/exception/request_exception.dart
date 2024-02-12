class RequestException implements Exception {
  final String message;
  final String code;

  const RequestException({this.code = '', this.message = 'Bad request'});

  @override
  String toString() => message;
}
