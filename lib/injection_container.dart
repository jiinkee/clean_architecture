import 'package:clean_architecture/core/network/api.dart';
import 'package:clean_architecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_architecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// declare all the singletons here
// will call this init function before runApp
Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Api>(Api());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  // anything related to state management should not be declared as singleton
  // because we need a new instance of bloc everytime the state changes
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(sl(), sl(), sl()));

}
