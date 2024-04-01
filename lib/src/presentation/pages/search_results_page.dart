import 'package:flutter/material.dart';

import '../../cubits/search_result_cubit.dart';
import '../../cubits/search_result_state.dart';
import '../utils/result_card_list.dart';

class SearchResultsPage extends StatefulWidget {
  final String searchTitle;

  const SearchResultsPage({super.key, required this.searchTitle});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late final SearchResultCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SearchResultCubit();
    cubit.fetchSearchResults(widget.searchTitle);
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
            tooltip: 'Voltar',
          ),
          title: const Text('Resultados da busca'),
        ),
        body: StreamBuilder<SearchResultState>(
            stream: cubit.stream,
            builder: (context, snapshot) {
              if (cubit.state is SearchResultInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (cubit.state is SearchResultSuccessState) {
                final searchResults = snapshot.data?.searchResults ?? [];
                if (searchResults.isNotEmpty) {
                  return ResultCardList(searchResultList: searchResults);
                }
                return const Center(
                    child: Text('Sem resultados para sua busca'));
              }
              return const Center(
                child: Text('Falha de conexão com a API'),
              );
            }));
  }
}
