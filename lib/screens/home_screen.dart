import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/news_viewmodel.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsViewModel>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/categories');
              break;
            case 2:
              Navigator.pushNamed(context, '/favorites');
              break;
          }
        },
      ),
    );
  }
}