import 'dart:convert';

import 'package:chat/data/models/remote/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getNews() async {
  var query = {
    'q': 'tesla',
    'language': 'ru',
    'from': '2024-01-08',
    'sortBy': 'publishedAt',
    'apiKey': '628097e14d0e4d68a6fd6657e05a73db'
  };
  var response =
  await http.get(Uri.https('newsapi.org', 'v2/everything', query));
  var jsonData = jsonDecode(response.body);

  List<Article> articles = [];
  Article article = Article();
  int i = 0;
  try {
    for (var item in jsonData['articles']) {
      article = Article.fromJson(item);
      articles.add(article);
      i++;
    }
  } catch (e) {
    print(e); //TODO: fix
  }
  return articles;
}
