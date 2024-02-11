import 'dart:convert';

import 'package:chat/data/models/remote/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getNews() async {
  var query = {
    'q': 'computers',
    'language': 'en',
    'from': '2024-01-11',
    'sortBy': 'publishedAt',
    'apiKey': '628097e14d0e4d68a6fd6657e05a73db'
  }; //TODO: make this dynamic (including date, topic and language (mb filters))
  var uri = Uri.https('newsapi.org', 'v2/everything', query);
  var response =
  await http.get(uri);
  var jsonData = jsonDecode(response.body);

  List<Article> articles = [];
  Article article = Article();
  try {
    for (var item in jsonData['articles']) {
      article = Article.fromJson(item);
      articles.add(article);
    }
  } catch (e) {
    print(e); //TODO: fix
  }
  print(articles.length);
  print(uri);
  return articles;
}
