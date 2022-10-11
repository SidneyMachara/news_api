import 'dart:convert';

import 'package:news_server/models/article.dart';
import 'package:news_server/repository/gnews_repository.dart';

class NewsService {
  final GNewsRepository _gNewsRepository = GNewsRepository();

  /// max --> maximum number of articles, between 1 - 100
  /// q --> articles containg keywords
  /// author --> aricle author
  Future<String> getArticles(String query) async {
    query = _gNewsRepository.buildQuery(query);
    List<Article> articles = await _gNewsRepository.getArticles(query);

    return jsonEncode({"Articles": articles});
  }
}
