import '../../model/search_history.dart';

abstract interface class ISearchHistoryRepository {
  Future<List<SearchHistory>> loadHistory();

  Future<List<SearchHistory>> addSearchToHistory(String search);

  Future<List<SearchHistory>> removeSearchFromHistory(int searchId);

  Future<List<SearchHistory>> clearHistory();
}
