import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_sources/news_data_source.dart';

import '../../../shared/api_constants.dart';
import '../models/NewsResponse.dart';

class NewsAPIDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.newsEndPoint,
        {'apiKey': APIConstants.apiKey, 'sources': sourceId});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromMap(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null)
      return newsResponse.articles!;
    else
      throw Exception("Failed to load News");
  }
}
