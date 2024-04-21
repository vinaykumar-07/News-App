// news_article_model.dart

class NewsArticle {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticle({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      sourceName: json['source']['name'] ?? "Not found",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "Not found",
      urlToImage: json['urlToImage'] ?? "Not found",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}
