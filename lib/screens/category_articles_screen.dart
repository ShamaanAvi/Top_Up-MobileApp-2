import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/news_viewmodel.dart';
import '../widgets/news_card.dart';

class CategoryArticlesScreen extends StatefulWidget {
  const CategoryArticlesScreen({super.key});

  @override
  CategoryArticlesScreenState createState() => CategoryArticlesScreenState();
}

class CategoryArticlesScreenState extends State<CategoryArticlesScreen> {
  bool _isFirstLoad = true; // To ensure the API call happens only once

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isFirstLoad) {
      final category = ModalRoute.of(context)!.settings.arguments as String;
      final newsViewModel = Provider.of<NewsViewModel>(context, listen: false);
      newsViewModel.fetchCategoryArticles(category);
      _isFirstLoad = false; // Prevent further API calls
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${ModalRoute.of(context)!.settings.arguments as String} News'),
      ),
      body: newsViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsViewModel.articles.isEmpty
          ? const Center(child: Text('No articles available'))
          : ListView.builder(
        itemCount: newsViewModel.articles.length,
        itemBuilder: (context, index) {
          final article = newsViewModel.articles[index];
          return NewsCard(
            article: article,
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: article);
            },
          );
        },
      ),
    );
  }
}
