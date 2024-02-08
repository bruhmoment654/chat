import 'package:chat/components/news_card.dart';
import 'package:chat/data/models/remote/article.dart';
import 'package:chat/services/news/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error.toString()}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Article> data = snapshot.data ?? [];

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    NewsCard(article: data[index]));
          },
        ),
      ),
    );
  }
}
