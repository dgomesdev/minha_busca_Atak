import '../model/search_result.dart';

abstract class SearchResultState {
  List<SearchResult> searchResults;

  SearchResultState({required this.searchResults});
}

class SearchResultInitialState extends SearchResultState {
  SearchResultInitialState() : super(searchResults: []);
}

class SearchResultSuccessState extends SearchResultState {
  SearchResultSuccessState({required super.searchResults});
}

class SearchResultErrorState extends SearchResultState {
  SearchResultErrorState() : super(searchResults: []);
}
