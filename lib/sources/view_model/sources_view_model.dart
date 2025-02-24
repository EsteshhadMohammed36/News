import 'package:flutter/cupertino.dart';
import 'package:news/sources/data/sources_data_source.dart';

import '../data/models/SourcesResponse.dart';

class SourcesViewModel with ChangeNotifier {
  SourcesDataSource dataSource = SourcesDataSource();
  bool isLoading = false;
  String? errorMsg;
  List<Source> sources = [];

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      //success
      SourcesResponse response = await dataSource.getSources(categoryId);
      //success
      if (response.status == "ok" && response.sources != null) //fooooocuss
        sources = response.sources!;
      //error
      else
        errorMsg = "Failed to get sources";
    } catch (error) {
      //error
      errorMsg = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
