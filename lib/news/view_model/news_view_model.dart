import 'package:flutter/material.dart';
import 'package:news/news/data/models/NewsResponse.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository newsRepository = NewsRepository(ServiceLocator.newsDataSource);
  bool isLoading = false; //loading
  String? errorMsg; //error
  List<News> news = []; //success

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      news = await newsRepository.getNews(sourceId);
    } catch (error) {
      errorMsg = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
