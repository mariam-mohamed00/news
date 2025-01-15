import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(
      String categoryId, String locale) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourceApi, {
      'apiKey': '9c1f5339332a42c6a972b8d0dfae0615',
      'category': categoryId,
      'language': locale
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<NewsResponse> getNewsBySourceId(
      {required String sourceId,
      int pageNumber = 1,
      required String language}) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c1f5339332a42c6a972b8d0dfae0615

    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi, {
      'apiKey': '9c1f5339332a42c6a972b8d0dfae0615',
      'sources': sourceId,
      'pageSize': '20',
      'page': '$pageNumber',
      'language': language
    });

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
