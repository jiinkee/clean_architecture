import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  // specify the initial state using super()
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    // register event at event handler
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emitter) async {
    final Either<Exception, List<ArticleEntity>> dataState = await _getArticleUseCase();
    dataState.fold((left) {
      emit(RemoteArticlesError(left));
    }, (right) {
      emit(RemoteArticlesDone(right));
    });
  }

}