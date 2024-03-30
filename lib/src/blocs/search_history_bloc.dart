import 'dart:async';

import 'package:my_google_search/src/blocs/search_history_event.dart';
import 'package:my_google_search/src/blocs/search_history_state.dart';
import 'package:my_google_search/src/data/local/search_history_repository_impl.dart';

class SearchHistoryBloc {
  final _searchHistoryRepository = SearchHistoryRepositoryImpl();

  final StreamController<SearchHistoryEvent> _inputSearchController =
      StreamController<SearchHistoryEvent>();
  final StreamController<SearchHistoryState> _outputSearchController =
      StreamController<SearchHistoryState>();

  Sink<SearchHistoryEvent> get inputSearch => _inputSearchController.sink;
  Stream<SearchHistoryState> get outputSearch => _outputSearchController.stream;

  SearchHistoryBloc() {
    _inputSearchController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(SearchHistoryEvent event) {
    List<String> searchHistory = [];

    if (event is LoadHistoryEvent) {
      searchHistory = _searchHistoryRepository.loadHistory();
    } else if (event is AddSearchToHistoryEvent) {
      searchHistory = _searchHistoryRepository.addSearchToHistory(event.search);
    } else if (event is RemoveSearchFromHistoryEvent) {
      searchHistory =
          _searchHistoryRepository.removeSearchFromHistory(event.search);
    } else if (event is ClearResultsEvent) {
      searchHistory = _searchHistoryRepository.clearHistory();
    }

    _outputSearchController
        .add(SearchHistorySuccessState(searchHistory: searchHistory));
  }
}
