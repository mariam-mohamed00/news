import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String locale = 'en';
  void changeLocale(String newLocale) async {
    locale = newLocale;
    notifyListeners();
  }

  // void changeNewsLanguage(String newLanguage) async {
  //   locale = newLanguage;
  //   notifyListeners();
  // }
}
