import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsInitialState());

  NewsRepository newsRepository = NewsRepository(ServiceLocator.newsDataSource);

  Future<void> getNews(String sourceId) async {
    emit(NewsLoadingState());
    try {
      final news = await newsRepository.getNews(sourceId);
      emit(NewsSuccessState(news));
    } catch (error) {
      emit(NewsErrorState(error.toString()));
    }
  }
}
