import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/source/data_source/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

SourceRepositoryContract injectSourceRepository() {
  return SourceRepositoryImpl(
    sourceRemoteDataSource: injectSourceRemoteDataSource(),
  );
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}