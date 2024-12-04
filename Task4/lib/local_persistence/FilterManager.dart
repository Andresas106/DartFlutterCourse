import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterManager
{
  static final FilterManager _instance = FilterManager._internal();
  factory FilterManager() => _instance;

  FilterManager._internal();

  String _currentFilter = 'price';

  Future<void> loadFilter() async
  {
    final prefs = await SharedPreferences.getInstance();
    _currentFilter = prefs.getString('productFilter') ?? 'price';
  }

  Future<void> saveFilter(String filterCode) async
  {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('productFilter', filterCode);
  }

  String get currentFilter => _currentFilter;
}