import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article.dart';
import '../viewmodels/favorites_viewmodel.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context)!.settings.arguments as Article;
    final favoritesViewModel = Provider.of<FavoritesViewModel>(context);

    final isFavorite = favoritesViewModel.isFavorite(article);

    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl),
            const SizedBox(height: 16),
            Text(article.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (article.author != null) Text('By ${article.author}', style: const TextStyle(fontSize: 16)),
            if (article.publishedAt != null) Text('Published: ${article.publishedAt}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(article.content ?? article.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (article.url != null) {
                  final uri = Uri.parse(article.url!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch ${article.url}';
                  }
                }
              },
              child: const Text('Read Full Article'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (isFavorite) {
                  favoritesViewModel.removeFromFavorites(article);
                } else {
                  favoritesViewModel.addToFavorites(article);
                }
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}