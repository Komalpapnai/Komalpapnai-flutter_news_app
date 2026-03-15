import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/api_service.dart';
import '../database/db_helper.dart';

class NewsProvider extends ChangeNotifier {

  List<Article> articles = [];
  bool loading = true;

  getNews() async {

    try {

      articles = await ApiService().fetchNews();

      for (var article in articles) {
        await DBHelper().insertArticle(article.toMap());
      }

    } catch (e) {

      final data = await DBHelper().getArticles();

      articles = data.map((e) =>
          Article(
            title: e['title'],
            description: e['description'],
            imageUrl: e['image'],
            source: e['source'],
            date: e['date'],
          )).toList();
    }

    loading = false;

    notifyListeners();
  }
}