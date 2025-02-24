import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/api_constants.dart';
import 'models/SourcesResponse.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.sourceEndPoint,
        {'apiKey': APIConstants.apiKey, 'category': categoryId});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
