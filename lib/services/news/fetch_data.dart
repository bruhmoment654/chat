import 'dart:convert';

import 'package:chat/data/models/remote/article.dart';
import 'package:chat/exception/article_serialize_exception.dart';
import 'package:chat/exception/request_exception.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<Article>> getNews({
  String topic = 'tesla',
  String language = 'en',
  String? from,
  String sortBy = 'publishedAt',
}) async {
  var query = {
    'q': topic,
    'language': language,
    'from': from ?? _getYesterdayDate(),
    'sortBy': sortBy,
    'apiKey': '628097e14d0e4d68a6fd6657e05a73db'
  }; //TODO: make this dynamic (including date, topic and language (mb filters))
  var uri = Uri.https('newsapi.org', 'v2/everything', query);
  var response = await http.get(uri);
  var jsonData = jsonDecode(response.body);

  if (response.statusCode != 200) {
    throw RequestException(
        code: jsonData['code'], message: jsonData['message']);
  }

  List<Article> articles = [];
  Article article = Article();
  try {
    for (var item in jsonData['articles']) {
      article = Article.fromJson(item);
      articles.add(article);
    }
  } catch (e) {
    throw const ArticleSerializeException();
  }
  return articles;
}

String _getYesterdayDate() {
  final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(yesterday);
  return formatted;
}
