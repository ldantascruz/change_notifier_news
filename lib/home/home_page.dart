import 'package:change_notifier_news/home/news_controller.dart';
import 'package:change_notifier_news/home/news_states.dart';
import 'package:flutter/material.dart';

import 'news_page.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = NewsController.instance;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.state is NewsErrorState) {
        final errorState = controller.state as NewsErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getNews(),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              print('animatedBuilder');
              if (controller.state is NewsLoadingState) {
                return const Center(
                  child: RefreshProgressIndicator(),
                );
              }

              return Center(
                child: ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: (context, index) {
                    final news = controller.news[index];
                    return ExpansionTile(
                      expandedAlignment: Alignment.centerLeft,
                      title: Text(news.title),
                      children: [
                        ListTile(subtitle: Text(news.description)),
                      ],
                    );
                  },
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicou na home');
          Navigator.of(context).pushNamed(NewsPage.routeName);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
