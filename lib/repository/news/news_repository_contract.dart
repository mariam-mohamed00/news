import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId, BuildContext context, int pageNumber);
}

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId, BuildContext context, int pageNumber);
}

abstract class NewsOfflineDataSource {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId);
}
