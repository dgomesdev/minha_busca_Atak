import 'package:flutter/material.dart';
import 'package:minha_busca_Atak/src/presentation/pages/home_page.dart';

void main() {
  runApp(const GoogleSearchApp());
}

class GoogleSearchApp extends StatelessWidget {
  const GoogleSearchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha busca Atak',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff3ddc84),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
