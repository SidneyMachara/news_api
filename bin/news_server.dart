import 'package:news_server/models/app_error.dart';
import 'package:news_server/services/news_service.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  var app = Router();
  var newsService = NewsService();

  app.get('/v1/articles', (
    Request request,
  ) async {
    try {
      String query = request.url.query;
      return Response.ok(await newsService.getArticles(query));
    } catch (e) {
      if (e is AppError) {
        return e.message;
      }

      return Response.badRequest(
        body: e,
      );
    }
  });

  await io.serve(app, 'localhost', 8080);
}
