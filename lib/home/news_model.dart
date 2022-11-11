class NewsModel {
  final String title;
  final String description;

  NewsModel(this.title, this.description);

  @override
  String toString() => 'NewsModel(title: $title, description: $description)';
}
