import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles; // return this when success
  final Exception? error; // return this when error

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(Exception error): super(error: error);
}