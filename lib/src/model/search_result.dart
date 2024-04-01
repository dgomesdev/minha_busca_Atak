class SearchResult {
  final String title;
  final String link;

  const SearchResult({required this.title, required this.link});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'title': String resultTitle, 'link': String resultLink} =>
        SearchResult(title: resultTitle, link: resultLink),
      _ => throw const FormatException(
          'Falha na conversão do formato do resultado da pesquisa')
    };
  }
}
