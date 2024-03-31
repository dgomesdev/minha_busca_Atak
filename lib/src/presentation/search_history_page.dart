import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_google_search/src/blocs/search_history_bloc.dart';
import 'package:my_google_search/src/blocs/search_history_event.dart';
import 'package:my_google_search/src/blocs/search_history_state.dart';

class SearchHistoryPage extends StatefulWidget {
  final SearchHistoryBloc bloc;

  const SearchHistoryPage({super.key, required this.bloc});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
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
          title: const Text('Search history')),
      body: BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
          bloc: widget.bloc,
          builder: (context, state) {
            if (state is SearchHistoryInitialState) {
              return const Center(
                  child: Text('Check your search history here'));
            } else if (state is SearchHistorySuccessState) {
              final searchHistory = state.searchHistory;
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: searchHistory.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                                title: Text(searchHistory[index].title),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    widget.bloc.add(
                                        RemoveSearchFromHistoryEvent(
                                            searchId: searchHistory[index].id));
                                  },
                                )),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FilledButton(
                        onPressed: () {
                          widget.bloc.add(ClearSearchHistoryEvent());
                        },
                        child: const Text('Clear history')),
                  )
                ],
              );
            }
            return const Center(
                child: Text('Error when loading the search history'));
          }),
    );
  }
}
