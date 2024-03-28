import 'package:flutter/material.dart';
import 'package:my_google_search/src/data/mocked_results_text.dart';
import 'package:my_google_search/src/utils/result_card_list.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Return ot home page',
        ),
        title: const Text('Results page'),
      ),
      body: ResultCardList(searchResultList: mockedResultListText),
    );
  }
}
