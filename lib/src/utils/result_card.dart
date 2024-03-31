import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            TextButton(
                onPressed: () {
                  _launchUrl();
                },
                child: Text(searchResult.link))
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(searchResult.link);
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
