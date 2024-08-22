import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:either_dart/either.dart';

abstract class ArticleRepository {
  Future<Either<Exception, List<ArticleEntity>>> getNewsArticle();
}