import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import '../utils/app_constants.dart';

class NewsApiService {
  Future<List<Article>> fetchArticles() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}top-headlines?apiKey=${AppConstants.apiKey}&country=us'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List).map((json) {
        return Article.fromJson(json);
      }).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Article>> fetchCategoryArticles(String category) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}top-headlines?apiKey=${AppConstants.apiKey}&country=us&category=$category'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List).map((json) {
        return Article.fromJson(json);
      }).toList();
    } else {
      throw Exception('Failed to load category articles');
    }
  }

  Future<List<Article>> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}everything?apiKey=${AppConstants.apiKey}&q=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List).map((json) {
        return Article.fromJson(json);
      }).toList();
    } else {
      throw Exception('Failed to search articles');
    }
  }
}
