import 'package:change_notifier_news/home/news_model.dart';
import 'package:change_notifier_news/home/news_states.dart';
import 'package:flutter/material.dart';

class MyException implements Exception {
  final String message;

  MyException(this.message);
}

class NewsController extends ChangeNotifier {
  static final NewsController instance = NewsController();
  final List<NewsModel> _news = [
    NewsModel('Cachorro perdido', 'o cachorro kaio sumiu'),
  ];
  List<NewsModel> get news => _news;

  NewsState state = NewsInitialState();

  Future<void> getNews() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> addNews(NewsModel news) async {
    print('entrou no addNews');
    updateState(NewsLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      throw (Exception('o kaio me trolaaaa'));
      _news.add(news);
      print('emitiu sucesso');
      updateState(NewsSuccessState());
    } on MyException catch (e) {
      updateState(NewsErrorState(e.message));
    } catch (e) {
      updateState(NewsErrorState(e.toString()));
    }
  }

  void updateState(NewsState newState) {
    state = newState;
    print('notificou $state');
    notifyListeners();
  }
}
