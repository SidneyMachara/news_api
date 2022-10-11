import 'package:news_server/models/article.dart';

abstract class NewsSource {
  /// returns articles based on query filters
  Future<List<Article>> getArticles(String query);

  /// maps query parms to particular news api params
  String buildQuery(String query);
}
