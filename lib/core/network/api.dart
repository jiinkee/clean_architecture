import 'package:clean_architecture/core/constants/constants.dart';
import 'package:dio/dio.dart';

class Api {
  late Dio _dio;

  Api({String? baseUrl}) {
    Dio(BaseOptions(
      baseUrl: baseUrl ?? newsApiBaseUrl,
    ));
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParam,
  }) async {
    try {
      Response response = await _dio.get(endpoint, queryParameters: queryParam);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
