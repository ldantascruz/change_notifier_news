import 'package:flutter/material.dart';

import 'news_controller.dart';
import 'news_model.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = '/news';

  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = NewsController.instance;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print('opaaa aconteceu algo');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.addNews(
                      NewsModel(
                        titleController.text,
                        descriptionController.text,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Create'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
