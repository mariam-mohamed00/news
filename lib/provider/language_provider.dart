import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  static String locale = 'en';
  void changeLocale(String newLocale) async {
    if (locale == newLocale) {
      return;
    }
    locale = newLocale;
    notifyListeners();
  }
}
