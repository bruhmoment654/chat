import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../data/models/remote/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 30),
      height: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                    image: NetworkImage(article.urlToImage ?? '')),
                borderRadius: BorderRadius.circular(10)),
            height: 125,
            width: 125,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 100,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        article.source.name ?? '',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ),
                    Text(
                      article.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      // style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        article.publishedAt?.year.toString() ?? '',
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
