import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.sourceApi,
      {
        'apiKey': '9c1f5339332a42c6a972b8d0dfae0615'
      }
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
