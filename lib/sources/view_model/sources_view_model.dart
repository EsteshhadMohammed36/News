import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';
import 'package:news/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  SourcesViewModel() : super(SourcesInitialState());

  SourcesRepository sourcesRepository =
      SourcesRepository(ServiceLocator.sourcesDataSource);

  Future<void> getSources(String categoryId) async {
    emit(SourcesLoadingState());
    try {
      //success
      final sources = await sourcesRepository.getSources(categoryId);
      emit(SourcesSuccessState(sources));
    } catch (error) {
      //error
      emit(SourcesErrorState(error.toString()));
    }
  }
}
