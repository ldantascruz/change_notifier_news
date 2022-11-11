abstract class NewsState {}

class NewsInitialState implements NewsState {}

class NewsLoadingState implements NewsState {}

class NewsSuccessState implements NewsState {}

class NewsErrorState implements NewsState {
  final String message;

  const NewsErrorState(this.message);
}
