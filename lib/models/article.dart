import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:news_server/models/source.dart';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });

  final String title;
  final String description;
  final String content;
  final String url;
  final String image;
  final String publishedAt;
  final Source source;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        content: json["content"],
        url: json["url"],
        image: json["image"],
        publishedAt: json["publishedAt"],
        source: Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "url": url,
        "image": image,
        "publishedAt": publishedAt,
        "source": source.toJson(),
      };
}
