import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/article.dart';
import '../services/api_service.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final ApiService _apiService = ApiService();
  static const String _boxName = 'news_box';

  Future<void> fetchArticles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Try fetching from API
      _articles = await _apiService.getTopHeadlines();
      
      // Save to local storage for offline use
      var box = await Hive.openBox<Article>(_boxName);
      await box.clear();
      await box.addAll(_articles);
      
    } catch (e) {
      // If API fails, try loading from local storage
      _errorMessage = e.toString();
      var box = await Hive.openBox<Article>(_boxName);
      if (box.isNotEmpty) {
        _articles = box.values.toList();
        _errorMessage = null; // Clear error if we have offline data
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
