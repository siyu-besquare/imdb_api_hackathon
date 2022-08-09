import 'package:imdb_api_hackathon/models/movie_model.dart';
import 'package:imdb_api_hackathon/services/search_service.dart';
import 'package:imdb_api_hackathon/states/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> fetchSearch({
    String? title,
    String? genres,
  }) async {
    SearchService searchService = SearchService();
    emit(SearchLoading());

    try {
      MovieModel searchModel = await searchService.fetchSearchInformation(
          titleName: title, genre: genres);
      emit(SearchLoaded(searchModel: searchModel));
    } catch (e) {
      emit(SearchError(errorMessage: e.toString()));
    }
  }
}
