import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource});
  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId, BuildContext context) {
    return sourceRemoteDataSource.getSourceByCategoryId(categoryId, context);
  }
}

