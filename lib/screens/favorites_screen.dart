import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/favorites_viewmodel.dart';
import '../widgets/news_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = Provider.of<FavoritesViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoritesViewModel.favorites.isEmpty
          ? const Center(child: Text('No favorite articles yet.'))
          : ListView.builder(
        itemCount: favoritesViewModel.favorites.length,
        itemBuilder: (context, index) {
          final article = favoritesViewModel.favorites[index];
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
