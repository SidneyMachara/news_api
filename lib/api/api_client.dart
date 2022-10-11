import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:news_server/models/app_error.dart';

String gNewsToken = "6a13de677067805d8ec710316bdf9736";
String gNewsBaseUrl = 'https://gnews.io/api/v4/search?';
String gNewsTopHeadlineBaseUrl = 'https://gnews.io/api/v4/top-headlines?';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    /// dio base settings
    BaseOptions options = BaseOptions(
      receiveTimeout: 100000,
      connectTimeout: 100000,
    );

    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      maxStale: const Duration(minutes: 10),
    );

    _dio = Dio(options)
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  ///
  Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      Options? _options;

      if (headers != null) {
        _options = Options(headers: headers);
      }

      response = await _dio.get(
        path,
        options: _options,
      );

      final int? statusCode = response.statusCode;

      return response;
    } catch (error) {
      throw AppError('Internal error');
    }
  }
}
