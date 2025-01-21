/// MVVM

// import 'package:flutter/material.dart';
// import 'package:news_app/api/api_manager.dart';
// import 'package:news_app/model/source_response.dart';
// import 'package:news_app/provider/language_provider.dart';

// class CategoryDetailsViewModel extends ChangeNotifier {
//   List<Source>? sourceList;
//   String? errMessage;
//   void getSourceByCategory(String categoryId) async {
//     sourceList = null;
//     errMessage = null;
//     notifyListeners();

// ignore_for_file: dangling_library_doc_comments

//     try {
//       var response =
//           await ApiManager.getSources(categoryId, LanguageProvider.locale);
//       if (response.status == 'error') {
//         errMessage = response.message;
//       } else {
//         /// status = ok
//         sourceList = response.sourcesList;
//       }
//     } catch (e) {
//       errMessage = 'Error loading source list';
//     }
//     notifyListeners();
//   }
// }