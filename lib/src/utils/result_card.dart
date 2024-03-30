import 'package:flutter/material.dart';

import '../model/search_result.dart';

class ResultCard extends StatelessWidget {
  final SearchResult searchResult;

  const ResultCard({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(searchResult.title),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: Text(searchResult.link))
          ],
        ),
      ),
    );
  }
}
