abstract interface class ISearchHistoryRepository {
  List<String> loadHistory();

  List<String> addSearchToHistory(String search);

  List<String> removeSearchFromHistory(String search);

  List<String> clearHistory();
}
