import '../data/models/SourcesResponse.dart';

abstract class SourcesState {}

class SourcesInitialState extends SourcesState {}

class SourcesLoadingState extends SourcesState {}

class SourcesSuccessState extends SourcesState {
  final List<Source> sources;

  SourcesSuccessState(this.sources);
}

class SourcesErrorState extends SourcesState {
  final String errorMsg;

  SourcesErrorState(this.errorMsg);
}
