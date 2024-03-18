import 'package:dio/dio.dart';
import 'article_model.dart';

class ApiService {
  static String apiKey = '711803c4c9f74be09393efd59ec52e64';
  static String homeUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  List<ArticleModel> articles = [];
  final dio = Dio();

  Future<List<ArticleModel>> getHttp() async {
    try {
      final response = await dio.get(homeUrl);
      if (response.statusCode == 200) {
        List<dynamic> articlesData = response.data['articles'];
        for (var articleData in articlesData) {
          ArticleModel article = ArticleModel.fromJson(articleData);
          articles.add(article);
        }
        print('===================');
        print(articles);
        return articles;
      } else {
        print('Failed to load data');
        return [];
      }
    } catch (e) {
      print('Exception occurred: $e');
      return [];
    }
  }
}
