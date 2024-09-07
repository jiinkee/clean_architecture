import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:either_dart/either.dart';

class GetArticleUseCase implements UseCase<Either<Exception, List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository); 
  
  @override
  Future<Either<Exception, List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }

}