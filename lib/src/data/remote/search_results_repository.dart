import '../../model/search_result.dart';

abstract interface class ISearchResultsRepository {
  Future<List<SearchResult>> fetchSearchResults(String queryText);
}
