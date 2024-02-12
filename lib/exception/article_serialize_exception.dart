class ArticleSerializeException implements Exception {
  final String message;

  const ArticleSerializeException({this.message = 'JSON serialize exception'});

  @override
  String toString() => message;
}
