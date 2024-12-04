import 'package:flutter/material.dart';
import '../models/article.dart';

class FavoriteCard extends StatelessWidget {
  final Article article;
  final VoidCallback onRemove;

  const FavoriteCard({super.key, required this.article, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Image.network(
          article.imageUrl,
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}