import 'package:clean_architecture/core/network/api.dart';
import 'package:clean_architecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// declare all the singletons here
// will call this init function before runApp
Future<void> initializeDependencies() async {
  sl.registerSingleton<Api>(Api());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // anything related to state management should not be declared as singleton
  // because we need a new instance of bloc everytime the state changes
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

}
