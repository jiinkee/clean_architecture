import 'package:clean_architecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class ArticleRepositoryImpl  implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  // data layer should use ArticleModel and not ArticleEntity
  // this does not violate the interface promise because we have ArticleModel extends ArticleEntity
  Future<Either<Exception, List<ArticleModel>>> getNewsArticle({
    String? country,
    String? category,
  }) async {
    try {
      final Response response = await _newsApiService.getNewsArticle(country: country, category: category);
      List<ArticleModel> articles = [];
      try {
        articles = ((response.data['articles'] ?? []) as List<dynamic>)
            .map((a) => ArticleModel.fromJson(a))
            .toList();
        return Right(articles);
      } catch (e) {
        return Left(Exception('getNewsArticle '));
      }
    } on DioException catch (de) {
      return Left(de);
    } on Exception catch (e) {
      return Left(e);
    }
  }

}