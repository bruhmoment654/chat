import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'articles.g.dart';

@JsonSerializable(explicitToJson: true)
class Articles {
  final List<Article> articles;

  Articles(this.articles);

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

  @override
  String toString() {
    return 'Articles{articles: $articles}';
  }
}
