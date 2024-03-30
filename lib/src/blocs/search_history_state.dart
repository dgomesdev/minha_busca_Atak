abstract class SearchHistoryState {
  List<String> searchHistory;

  SearchHistoryState({required this.searchHistory});
}

class SearchHistoryInitialState extends SearchHistoryState {
  SearchHistoryInitialState() : super(searchHistory: []);
}

class SearchHistorySuccessState extends SearchHistoryState {
  SearchHistorySuccessState({required super.searchHistory});
}
