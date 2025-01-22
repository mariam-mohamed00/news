import 'package:news_app/model/source_response.dart';
/// interface repository 
abstract class SourceRepositoryContract {
  Future<SourceResponse?> getSourceByCategoryId(String categoryId);
}

/// interface data source
abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSourceByCategoryId(String categoryId);
}

abstract class SourceOfflineDataSource {}
