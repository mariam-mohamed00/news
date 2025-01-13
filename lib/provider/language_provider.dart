import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String locale = 'en';
  void changeLocale(String newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}
