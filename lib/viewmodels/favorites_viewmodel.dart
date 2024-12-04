import 'package:flutter/foundation.dart';
import '../models/article.dart';

class FavoritesViewModel with ChangeNotifier {
  final List<Article> _favorites = [];

  List<Article> get favorites => List.unmodifiable(_favorites);

  void addToFavorites(Article article) {
    if (!_favorites.contains(article)) {
      _favorites.add(article);
      notifyListeners();
    }
  }

  void removeFromFavorites(Article article) {
    _favorites.remove(article);
    notifyListeners();
  }

  bool isFavorite(Article article) {
    return _favorites.contains(article);
  }
}