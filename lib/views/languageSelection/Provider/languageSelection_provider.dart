import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _applocale;

  Locale? get applocale => _applocale;

  LanguageChangeController() {
    _loadSavedLanguage();
  }

  // Load saved language from SharedPreferences
  void _loadSavedLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString('language_code');

    if (languageCode == null || languageCode.isEmpty) {
      _applocale = Locale('en'); // Default to 'en'
    } else {
      _applocale = Locale(languageCode);
    }
    notifyListeners();
  }

  // Change and save the language
  void changeLanguage(Locale languageType) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocale = languageType;

    await sp.setString('language_code', languageType.languageCode);
    notifyListeners();
  }

  // Update language and notify listeners on save button press
  void updateLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString('language_code');

    if (languageCode == null || languageCode.isEmpty) {
      _applocale = Locale('en'); // Default to 'en'
    } else {
      _applocale = Locale(languageCode);
    }
    notifyListeners();
  }
}
