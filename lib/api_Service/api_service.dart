import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ServiceApi {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=933da65a36384e78983ee052b6c8cfa4";

  Future<List<Article>> getArticle() async {
    var newsModel;
    try {
      Response res = await get(Uri.parse(endPointUrl));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<Article> newsModel =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return newsModel;
      }
    } catch (Exception) {
      return newsModel;
    }
    return getArticle();
  }
}
