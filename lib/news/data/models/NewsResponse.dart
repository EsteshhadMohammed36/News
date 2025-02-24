import 'dart:convert';

import 'package:news/sources/data/models/SourcesResponse.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<News> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(String source) =>
      NewsResponse.fromMap(json.decode(source));

  factory NewsResponse.fromMap(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<News>.from(json["articles"].map((x) => News.fromMap(x))),
      );
}

class News {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  News({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory News.fromMap(Map<String, dynamic> json) => News(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
