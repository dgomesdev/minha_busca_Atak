import 'package:flutter/material.dart';
import 'package:minha_busca_Atak/src/presentation/pages/search_history_page.dart';
import 'package:minha_busca_Atak/src/presentation/pages/search_results_page.dart';

import '../../blocs/search_history_bloc.dart';
import '../../blocs/search_history_event.dart';
import '../../cubits/search_result_cubit.dart';

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
    bloc.add(LoadHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha busca Atak'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchHistoryPage(bloc: bloc, cubit: cubit),
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
            const Image(image: AssetImage('assets/Atak-sistemas.png')),
            const SizedBox(height: 16),
            TextField(
                onChanged: (queryText) {
                  setState(() {
                    query = queryText;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Digite o que quer buscar',
                )),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: query.isEmpty
                  ? null // Disable the button if query is empty
                  : () {
                      bloc.add(AddSearchToHistoryEvent(searchTitle: query));
                      cubit.fetchSearchResults(query);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultsPage(searchTitle: query),
                        ),
                      );
                    },
              style: ButtonStyle(
                backgroundColor: query.isEmpty
                    ? MaterialStateProperty.all<Color>(
                        Colors.grey) // Change color when disabled
                    : MaterialStateProperty.all<Color>(
                        Colors.black), // Change color when enabled
                // Change opacity when disabled
              ),
              child: const Text('Buscar'),
            )
          ],
        ),
      ),
    );
  }
}
