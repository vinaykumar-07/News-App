// news_controller.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/news_artical_model.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articles = [].obs;
  var errorMessage = ''.obs;

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=IN&apiKey=07f39befc2f0422997903951883ba10d'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        List<dynamic> articlesData = jsonData['articles'];
        articles.clear(); // Clear existing articles
        articles.addAll(articlesData
            .map((articleJson) => NewsArticle.fromJson(articleJson)));
      } else {
        errorMessage('Failed to load news');
      }
    } catch (e) {
      errorMessage('Failed to connect to the internet');
    } finally {
      isLoading(false);
    }
  }
}
