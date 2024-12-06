import 'dart:convert';
import 'package:flutter/services.dart';

class LanguageManager
{
  static final LanguageManager _instance = LanguageManager._internal();
  factory LanguageManager() => _instance;

  LanguageManager._internal();

  Map<String, dynamic> _translations = {};
  String _currentLanguage = 'en';


  Future<void> loadTranslations(String languageCode) async
  {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/language.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      _translations = jsonData[languageCode] ?? {};
      _currentLanguage = languageCode;
    } catch (e) {
      throw Exception('Error loading translations: $e');
    }
  }

  Future<void> changeLanguage(String languageCode) async
  {
    await loadTranslations(languageCode);
  }

  String translate(String key)
  {
    return _translations[key] ?? key;
  }

  String get currentLanguage => _currentLanguage;
}