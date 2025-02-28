import 'package:news/sources/data/models/SourcesResponse.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId);
}
