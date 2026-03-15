import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/news_provider.dart';
import 'screens/headlines_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => NewsProvider()..getNews(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News App",
        theme: ThemeData.dark(),
        home: HeadlinesScreen(),
      ),
    );
  }
}