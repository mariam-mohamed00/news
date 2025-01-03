import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourceApi,
        {'apiKey': '9c1f5339332a42c6a972b8d0dfae0615', 'category': categoryId});
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c1f5339332a42c6a972b8d0dfae0615

    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi,
        {'apiKey': '9c1f5339332a42c6a972b8d0dfae0615', 'sources': sourceId});

    try {
      var reponse = await http.get(url);
      var json = jsonDecode(reponse.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  static Future<NewsResponse> searchNews(String query) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c1f5339332a42c6a972b8d0dfae0615

    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi,
        {'apiKey': '9c1f5339332a42c6a972b8d0dfae0615', 'q': query});

    try {
      var reponse = await http.get(url);
      var json = jsonDecode(reponse.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
