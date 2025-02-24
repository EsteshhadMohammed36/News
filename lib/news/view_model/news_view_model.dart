import 'package:flutter/material.dart';
import 'package:news/news/data/models/NewsResponse.dart';
import 'package:news/news/data/news_data_source.dart';

class NewsViewModel with ChangeNotifier {
  NewsDataSource dataSource = NewsDataSource();
  bool isLoading = false; //loading
  String? errorMsg; //error
  List<News> news = []; //success

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      NewsResponse response = await dataSource.getNews(sourceId);
      if (response.status == "ok" && response.articles != null)
        news = response.articles!;
      else
        errorMsg = "Failed to get news";
    } catch (error) {
      errorMsg = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
