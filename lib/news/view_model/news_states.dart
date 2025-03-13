import '../data/models/NewsResponse.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<News> news;

  NewsSuccessState(this.news);
}

class NewsErrorState extends NewsState {
  final String errorMsg;

  NewsErrorState(this.errorMsg);
}
