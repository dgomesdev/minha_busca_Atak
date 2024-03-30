import 'package:my_google_search/src/data/local/search_history_repository.dart';

class SearchHistoryRepositoryImpl implements ISearchHistoryRepository {
  final List<String> _searchHistory = [];

  @override
  List<String> addSearchToHistory(String search) {
    _searchHistory.add(search);
    return _searchHistory;
  }

  @override
  List<String> clearHistory() {
    _searchHistory.clear();
    return _searchHistory;
  }

  @override
  List<String> loadHistory() {
    _searchHistory.addAll(['Maringá', 'Search 2', 'Search 3']);
    return _searchHistory;
  }

  @override
  List<String> removeSearchFromHistory(String search) {
    _searchHistory.remove(search);
    return _searchHistory;
  }
}
