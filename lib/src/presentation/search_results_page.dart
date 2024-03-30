import 'package:flutter/material.dart';
import 'package:my_google_search/src/cubits/search_result_state.dart';
import 'package:my_google_search/src/utils/result_card_list.dart';

import '../cubits/search_result_cubit.dart';

class SearchResultsPage extends StatefulWidget {
  final String queryText;

  const SearchResultsPage({super.key, required this.queryText});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late final SearchResultCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SearchResultCubit();
    cubit.fetchSearchResults(widget.queryText);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Return to home page',
          ),
          title: const Text('Results page'),
        ),
        body: StreamBuilder<SearchResultState>(
            stream: cubit.stream,
            builder: (context, snapshot) {
              final searchResults = snapshot.data?.searchResults ?? [];
              if (searchResults.isNotEmpty) {
                return ResultCardList(searchResultList: searchResults);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
