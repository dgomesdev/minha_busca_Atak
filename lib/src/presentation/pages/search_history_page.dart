import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minha_busca_Atak/src/presentation/pages/search_results_page.dart';

import '../../blocs/search_history_bloc.dart';
import '../../blocs/search_history_event.dart';
import '../../blocs/search_history_state.dart';
import '../../cubits/search_result_cubit.dart';

class SearchHistoryPage extends StatefulWidget {
  final SearchHistoryBloc bloc;
  final SearchResultCubit cubit;

  const SearchHistoryPage({super.key, required this.bloc, required this.cubit});

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
            tooltip: 'Voltar',
          ),
          title: const Text('Histórico de buscas')),
      body: BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
          bloc: widget.bloc,
          builder: (context, state) {
            if (state is SearchHistoryInitialState) {
              return const Center(
                  child: Text('Seu histórico de buscas aparecerá aqui'));
            } else if (state is SearchHistorySuccessState) {
              final searchHistory = state.searchHistory;
              if (searchHistory.isEmpty) {
                return const Center(
                    child: Text('Seu histórico de buscas aparecerá aqui'));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: searchHistory.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                                title: TextButton(
                                  onPressed: () {
                                    widget.cubit.fetchSearchResults(
                                        searchHistory[index].title);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchResultsPage(
                                            searchTitle:
                                                searchHistory[index].title),
                                      ),
                                    );
                                  },
                                  child: Text(searchHistory[index].title),
                                ),
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
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      child: const Text(
                          'Limpar histórico'), // Change color when enabled
                      // Change opacity when disabled
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text('Erro ao carregar o histórico'));
          }),
    );
  }
}
