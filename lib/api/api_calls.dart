import "package:news_server/api/api_client.dart";
import 'package:news_server/models/article.dart';

class ApiCalls {
  ApiClient client = ApiClient();

  /// get GNews articles
  Future<List<Article>> getArticlesFromGNews(
    String query,
  ) async {
    String url = '$gNewsTopHeadlineBaseUrl?&token=$gNewsToken';

    if (query.contains('q=')) {
      url = '$gNewsBaseUrl$query&token=$gNewsToken';
    }

    var res = await client.getRequest(url);

    List articles = res.data['articles'];

    return articles.map((json) => Article.fromJson(json)).toList();
  }
}
