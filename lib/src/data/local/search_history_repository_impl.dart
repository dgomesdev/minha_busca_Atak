import 'package:my_google_search/src/data/local/database/db.dart';
import 'package:my_google_search/src/data/local/search_history_repository.dart';
import 'package:my_google_search/src/model/search_history.dart';
import 'package:sqflite/sqflite.dart';

class SearchHistoryRepositoryImpl implements ISearchHistoryRepository {
  late Database database;

  SearchHistoryRepositoryImpl() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    database = await DB.instance.database;
  }

  @override
  Future<List<SearchHistory>> addSearchToHistory(String search) async {
    var value = {'title': search} as Map<String, Object>;
    await database.insert('searches', value);
    return loadHistory();
  }

  @override
  Future<List<SearchHistory>> clearHistory() async {
    await database.delete('searches');
    return loadHistory();
  }

  @override
  Future<List<SearchHistory>> loadHistory() async {
    final searchHistory = await database.rawQuery('SELECT * FROM searches');
    return searchHistory
        .map((search) => SearchHistory.fromJson(search as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<SearchHistory>> removeSearchFromHistory(int searchId) async {
    await database.delete('searches', where: 'id = $searchId');
    return loadHistory();
  }
}
