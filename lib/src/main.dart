import 'package:flutter/material.dart';
import 'package:my_google_search/src/presentation/home_page.dart';

void main() {
  runApp(const GoogleSearchApp());
}

class GoogleSearchApp extends StatelessWidget {
  const GoogleSearchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff3ddc84),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}