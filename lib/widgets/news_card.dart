import 'package:flutter/material.dart';
import '../models/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const NewsCard({super.key, required this.article, required this.onTap});

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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.author != null) Text('By ${article.author}', style: const TextStyle(fontSize: 12)),
            if (article.publishedAt != null) Text('Published: ${article.publishedAt}', style: const TextStyle(fontSize: 12)),
            Text(article.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
