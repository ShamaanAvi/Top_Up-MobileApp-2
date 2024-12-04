import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CategoryArticlesScreen with the selected category
        Navigator.pushNamed(
          context,
          '/category_articles',
          arguments: category,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 3,
        child: Center(
          child: Text(
            category,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
