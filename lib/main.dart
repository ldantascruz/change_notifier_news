import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'home/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // /home/news
        MyHomePage.routeName: (context) => const MyHomePage(),
        NewsPage.routeName: (context) => const NewsPage(),
      },
      initialRoute: '/home',
    );
  }
}
