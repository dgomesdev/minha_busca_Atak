import 'package:flutter/material.dart';
import 'package:my_google_search/src/blocs/search_history_bloc.dart';
import 'package:my_google_search/src/blocs/search_history_event.dart';
import 'package:my_google_search/src/blocs/search_history_state.dart';

class SearchHistoryPage extends StatefulWidget {
  const SearchHistoryPage({super.key});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  late final SearchHistoryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchHistoryBloc();
    bloc.inputSearch.add(LoadHistoryEvent());
  }

  @override
  void dispose() {
    bloc.inputSearch.close();
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
          title: const Text('Search history')),
      body: StreamBuilder<SearchHistoryState>(
          stream: bloc.outputSearch,
          builder: (context, AsyncSnapshot<SearchHistoryState> snapshot) {
            final searchHistory = snapshot.data?.searchHistory ?? [];
            return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: searchHistory.length,
                itemBuilder: (BuildContext context, int index) =>
                    Text(searchHistory[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider());
          }),
    );
  }
}
