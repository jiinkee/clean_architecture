import 'package:clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on <GetSavedArticles> (onGetSavedArticles);
    on <SaveArticle> (onSaveArticle);
    on <RemoveArticle> (onRemoveArticle);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
