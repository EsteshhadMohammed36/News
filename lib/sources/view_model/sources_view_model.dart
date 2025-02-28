import 'package:flutter/cupertino.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';

import '../data/models/SourcesResponse.dart';

class SourcesViewModel with ChangeNotifier {
  SourcesRepository sourcesRepository =
      SourcesRepository(ServiceLocator.sourcesDataSource);
  bool isLoading = false;
  String? errorMsg;
  List<Source> sources = [];

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      //success
      sources = await sourcesRepository.getSources(categoryId);
    } catch (error) {
      //error
      errorMsg = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
