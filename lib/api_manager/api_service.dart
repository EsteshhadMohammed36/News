import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_manager/api_constants.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';

class APIService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.sourceEndPoint,
        {'apiKey': APIConstants.apiKey, 'category': categoryId});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
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
