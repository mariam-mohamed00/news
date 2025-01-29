import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse?> getNewsByCategoryId(String categoryId, BuildContext context, int pageNumber) {
    return newsRemoteDataSource.getNewsByCategoryId(categoryId, context,pageNumber);
  }
}