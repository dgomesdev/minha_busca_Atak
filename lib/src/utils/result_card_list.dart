import 'package:flutter/material.dart';
import 'package:my_google_search/src/utils/result_card.dart';

import '../model/search_result.dart';

class ResultCardList extends StatelessWidget {
  final List<SearchResult> searchResultList;

  const ResultCardList({super.key, required this.searchResultList});

  @override
  Widget build(BuildContext context) {
    if (searchResultList.isEmpty) {
      return const Center(
        child: Text('The list is empty'),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: searchResultList.length,
      itemBuilder: (BuildContext context, int index) =>
          ResultCard(searchResult: searchResultList[index]),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
