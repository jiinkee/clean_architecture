import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:either_dart/either.dart';

abstract class ArticleRepository {
  // API methods
  Future<Either<Exception, List<ArticleEntity>>> getNewsArticle();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}