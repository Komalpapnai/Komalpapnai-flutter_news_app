import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  // User will provide their own API key here
  static const String _apiKey = '1ca00e9919874a8bb2b316ac4bd00a38';

  Future<List<Article>> getTopHeadlines() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
