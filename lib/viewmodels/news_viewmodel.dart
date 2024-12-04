import 'package:flutter/foundation.dart';
import '../models/article.dart';
import '../services/news_api_service.dart';

class NewsViewModel with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await NewsApiService().fetchArticles();
    } catch (e) {
      debugPrint('Error fetching news: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategoryArticles(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await NewsApiService().fetchCategoryArticles(category);
    } catch (e) {
      debugPrint('Error fetching category articles: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
