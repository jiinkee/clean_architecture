import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

class ArticleRepositoryImpl  implements ArticleRepository {
  @override
  // data layer should use ArticleModel and not ArticleEntity
  // this does not violate the interface promise because we have ArticleModel extends ArticleEntity
  Future<DataState<List<ArticleModel>>> getNewsArticle() {
    throw UnimplementedError();
  }

}