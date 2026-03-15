import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class HeadlinesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final news = Provider.of<NewsProvider>(context);

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "HEADLINES",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),

      body: news.loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(

        onRefresh: () async {
          news.getNews();
        },

        child: ListView.builder(
          itemCount: news.articles.length,
          itemBuilder: (context, index) {

            return NewsCard(
              article: news.articles[index],
            );
          },
        ),
      ),
    );
  }
}