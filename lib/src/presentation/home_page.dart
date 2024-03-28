import 'package:flutter/material.dart';
import 'package:my_google_search/src/presentation/results_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String query = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Google Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                onChanged: (queryText) => query = queryText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                )
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ResultsPage(),
                  ),
                );
              },
              child: const Text('Search')
            )
          ],
        ),
      ),
    );
  }
}

// Apenas um campo para entrada de dados do valor a ser pesquisado;
//     Um botão para disparar a pesquisa;
//     Um container para exibir o resultado.