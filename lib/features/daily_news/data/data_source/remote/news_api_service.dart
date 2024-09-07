import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/network/api.dart';
import 'package:dio/dio.dart';

class NewsApiService {
  final Api _api;

  const NewsApiService(this._api);

  Future<Response> getNewsArticle({
    String? country, String? category,
  }) async {
    final Response res = await _api.get('/top-headlines', queryParam: {
      'country': country ?? countryQuery,
      'category': category ?? categoryQuery,
    });
    return res;
  }
}
