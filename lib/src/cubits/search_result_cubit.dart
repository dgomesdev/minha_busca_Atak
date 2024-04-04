import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_google_search/src/cubits/search_result_state.dart';

import '../data/remote/search_results_repository_impl.dart';
import '../model/search_result.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final _searchResultsRepository = SearchResultsRepositoryImpl();

  SearchResultCubit() : super(SearchResultInitialState());

  void fetchSearchResults(String queryText) async {
    List<SearchResult> searchResults = [];

    try {
      searchResults =
          await _searchResultsRepository.fetchSearchResults(queryText);
      emit(SearchResultSuccessState(searchResults: searchResults));
    } catch (e) {
      emit(SearchResultErrorState());
    }
  }
}
