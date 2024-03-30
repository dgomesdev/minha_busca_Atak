import 'package:flutter/material.dart';
import 'package:my_google_search/src/blocs/search_history_event.dart';
import 'package:my_google_search/src/cubits/search_result_cubit.dart';
import 'package:my_google_search/src/presentation/search_history_page.dart';
import 'package:my_google_search/src/presentation/search_results_page.dart';

import '../blocs/search_history_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SearchHistoryBloc bloc;
  late final SearchResultCubit cubit;
  String query = '';

  @override
  void initState() {
    super.initState();
    cubit = SearchResultCubit();
    bloc = SearchHistoryBloc();
    bloc.inputSearch.add(LoadHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Google Search'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchHistoryPage(),
                  ),
                );
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                onChanged: (queryText) {
                  setState(() {
                    query = queryText;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                )),
            const SizedBox(height: 16),
            FilledButton(
                onPressed: () {
                  bloc.inputSearch.add(AddSearchToHistoryEvent(search: query));
                  cubit.fetchSearchResults(query);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchResultsPage(queryText: query),
                    ),
                  );
                },
                child: const Text('Search'))
          ],
        ),
      ),
    );
  }
}
