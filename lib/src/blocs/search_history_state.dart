import 'package:my_google_search/src/model/search_history.dart';

abstract class SearchHistoryState {
  List<SearchHistory> searchHistory;

  SearchHistoryState({required this.searchHistory});
}

class SearchHistoryInitialState extends SearchHistoryState {
  SearchHistoryInitialState() : super(searchHistory: []);
}

class SearchHistorySuccessState extends SearchHistoryState {
  SearchHistorySuccessState({required super.searchHistory});
}

class SearchHistoryErrorState extends SearchHistoryState {
  SearchHistoryErrorState() : super(searchHistory: []);
}
