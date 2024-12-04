import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/search_viewmodel.dart';
import '../widgets/news_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search news...'),
          onChanged: (query) {
            searchViewModel.searchArticles(query);
          },
        ),
      ),
      body: searchViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: searchViewModel.articles.length,
        itemBuilder: (context, index) {
          final article = searchViewModel.articles[index];
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