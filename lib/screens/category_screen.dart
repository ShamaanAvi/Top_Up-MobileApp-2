import 'package:flutter/material.dart';
import '../widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Technology', 'Sports', 'Health', 'Business', 'Entertainment'];

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(category: categories[index]);
        },
      ),
    );
  }
}
