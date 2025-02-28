import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/NewsResponse.dart';

class NewsRepository {
  NewsDataSource newsDataSource;

  //Di
  NewsRepository(this.newsDataSource);

  Future<List<News>> getNews(String sourceId) async {
    return newsDataSource.getNews(sourceId);
  }
}
