import 'package:news/sources/data/data_sources/sources_data_source.dart';

import '../models/SourcesResponse.dart';

class SourcesRepository {
  SourcesDataSource dataSource;

  //DI
  SourcesRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}
