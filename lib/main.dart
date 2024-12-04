import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/article_details_screen.dart';
import 'package:news_app_flutter/screens/category_screen.dart';
import 'package:news_app_flutter/screens/favorites_screen.dart';
import 'package:news_app_flutter/screens/category_articles_screen.dart'; // New screen
import 'viewmodels/favorites_viewmodel.dart';
import 'package:news_app_flutter/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'viewmodels/news_viewmodel.dart';
import 'viewmodels/search_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/categories': (context) => const CategoryScreen(),
          '/favorites': (context) => const FavoritesScreen(),
          '/details': (context) => const ArticleDetailsScreen(),
          '/category_articles': (context) => const CategoryArticlesScreen(), // New route
        },
      ),
    );
  }
}
