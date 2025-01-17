import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/provider/language_provider.dart';

class NewsContainerViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errMessage;

  void getNewsBtSourceId(String sourceId) async {
    newsList = null;
    errMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getNewsBySourceId(
          sourceId: sourceId, language: LanguageProvider.locale);
      if (response.status == 'error') {
        errMessage = response.message;
      } else {
        newsList = response.articlesList;
      }
    } catch (e) {
      errMessage = 'Error loading news list';
    }
    notifyListeners();
  }
}
