import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minha_busca_Atak/src/data/remote/search_results_repository.dart';

import '../../model/search_result.dart';

class SearchResultsRepositoryImpl implements ISearchResultsRepository {
  @override
  Future<List<SearchResult>> fetchSearchResults(String queryText) async {
    final response = await http.get(
      Uri.parse(
          'http://ec2-3-88-165-28.compute-1.amazonaws.com:8080/search/$queryText'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body);
      return parseToListResult(results);
    } else {
      throw Exception(
          'Falha na conversão dos dados dos resultados da pesquisa');
    }
  }

  List<SearchResult> parseToListResult(List results) =>
      results.map((result) => SearchResult.fromJson(result)).toList();
}
