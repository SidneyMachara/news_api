import 'package:news_server/api/api_calls.dart';
import 'package:news_server/models/article.dart';
import 'package:news_server/services/news_source.dart';

class GNewsRepository extends NewsSource {
  final ApiCalls _apiCalls = ApiCalls();

  @override
  String buildQuery(String query) {
    return query;
  }

  @override
  Future<List<Article>> getArticles(String query) async {
    // G news does not offer Author info or filter
    if (query.toLowerCase().contains('author=')) {
      return <Article>[];
    }

    return await _apiCalls.getArticlesFromGNews(query);
  }
}
