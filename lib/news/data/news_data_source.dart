import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/api_constants.dart';
import 'models/NewsResponse.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.newsEndPoint,
        {'apiKey': APIConstants.apiKey, 'sources': sourceId});
    try {
      http.Response response = await http.get(url);
      Map<String, dynamic> json = jsonDecode(response.body);
      return NewsResponse.fromMap(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
