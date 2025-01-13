import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String? _categoryId;

  String? get categoryId => _categoryId;

  void setCategoryId(String newCategoryId) {
    _categoryId = newCategoryId;
    notifyListeners();
  }
}
