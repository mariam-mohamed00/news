import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/settings_cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());

  String currentLanguage = 'en';
  void changeLanguage(String newLanguage) async {
    if (currentLanguage == newLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    emit(LanguageState());
  }
}
