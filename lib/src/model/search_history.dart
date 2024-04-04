class SearchHistory {
  int id;
  String title;

  SearchHistory({required this.id, required this.title});

  factory SearchHistory.fromJson(Map<String, dynamic> search) {
    return switch (search) {
      {'id': int searchId, 'title': String searchTitle} =>
        SearchHistory(id: searchId, title: searchTitle),
      _ => throw const FormatException('Error when loading the history')
    };
  }
}
