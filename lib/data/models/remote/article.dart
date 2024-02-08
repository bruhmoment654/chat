import 'package:json_annotation/json_annotation.dart';

import 'source.dart';

part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article {
  @override
  String toString() {
    return 'Article{title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt}';
  }

  final Source source;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;

  Article(
      {this.source = const Source(name: ""),
      this.title = "",
      this.description = "",
      this.url = "",
      this.urlToImage = "",
      this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
