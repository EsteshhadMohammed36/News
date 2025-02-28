import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/sources/data/data_sources/sources_data_source.dart';

import '../../../shared/api_constants.dart';
import '../models/SourcesResponse.dart';

class SourcesAPIDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.sourceEndPoint,
        {'apiKey': APIConstants.apiKey, 'category': categoryId});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception("Failed to load sources");
    }
  }
}
