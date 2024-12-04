class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String? author;
  final String? content;
  final String? publishedAt;
  final String? url;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.author,
    this.content,
    this.publishedAt,
    this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'],
      content: json['content'],
      publishedAt: json['publishedAt'],
      url: json['url'],
    );
  }
}