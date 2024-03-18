class ArticleModel {
  final String title;
  final String desc;
  final String imgUrl;

  ArticleModel({required this.title, required this.desc, required this.imgUrl});

  factory ArticleModel.fromJson(dynamic data) {
    return ArticleModel(
      title: data['title'] ?? '',
      desc:  data['description'] ?? '',
      imgUrl:  data['urlToImage'] ?? '',
    );
  }
}
