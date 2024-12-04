import 'package:flutter/foundation.dart';
import '../models/article.dart';
import '../services/news_api_service.dart';

class SearchViewModel with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  void searchArticles(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      _articles = await NewsApiService().searchArticles(query);
    } catch (e) {
      debugPrint('Error searching articles: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}