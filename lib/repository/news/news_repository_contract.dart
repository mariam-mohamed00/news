import 'package:news_app/model/news_response.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId);
}

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId);
}

abstract class NewsOfflineDataSource {
  Future<NewsResponse?> getNewsByCategoryId(String categoryId);
}
