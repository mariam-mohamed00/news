import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  ApiManager._(); // private constructor
  static ApiManager? _instance; // null , apimanager
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourceResponse> getSources(String categoryId, String locale) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourceApi, {
      /// 9c1f5339332a42c6a972b8d0dfae0615
      /// 160b37cde254481a8ed739c8867411d1
      /// 3f0ec4484ce14b35bff1da3de6b55eb3
      'apiKey': '3f0ec4484ce14b35bff1da3de6b55eb3',
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

  Future<NewsResponse> getNewsBySourceId(
      {required String sourceId,
      int pageNumber = 1,
      required String language}) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c1f5339332a42c6a972b8d0dfae0615

    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi, {
      'apiKey': '3f0ec4484ce14b35bff1da3de6b55eb3',
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
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi,
        {'apiKey': '3f0ec4484ce14b35bff1da3de6b55eb3', 'q': query});

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
