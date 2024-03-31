import 'dart:convert';

import 'package:my_google_search/src/data/remote/search_results_repository.dart';
import 'package:my_google_search/src/model/search_result.dart';
import 'package:my_google_search/src/utils/mocked_results_json.dart';

class SearchResultsRepositoryImpl implements ISearchResultsRepository {
  @override
  Future<List<SearchResult>> fetchSearchResults(String queryText) async {
    //final response =
    //    await http.get(Uri.parse('https://www.google.com/search?q=$queryText'));
    //var results = jsonDecode(response.body) as List;
    final List<dynamic> mockedResults =
        jsonDecode(mockedResultsJson)['results'];
    return mockedResults
        .map((result) => SearchResult.fromJson(result as Map<String, dynamic>))
        .toList();
  }

  List<SearchResult> parseToListResult(List results) =>
      results.map((result) => SearchResult.fromJson(result)).toList();
}
