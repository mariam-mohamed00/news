import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

NewsRepositoryContract injectNewsRepository() {
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());

}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager : ApiManager.getInstance());
}
