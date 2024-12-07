

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/local_persistence/FilterManager.dart';
import 'package:task2/local_persistence/LanguageManager.dart';

class ConfigurationScreen extends StatefulWidget {

  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  late String _selectedLanguage;
  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings()
  {
    _selectedLanguage = LanguageManager().currentLanguage;
    _selectedFilter = FilterManager().currentFilter;
    setState(() {});
  }

  Future<void> _changeLanguage(String language) async
  {
    setState(() {
      _selectedLanguage = language;
    });
    await LanguageManager().changeLanguage(language);
  }

  Future<void> _changeFilter(String filter) async
  {
    setState(() {
      _selectedFilter = filter;
    });
    await FilterManager().saveFilter(filter);
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop({
      'language' : _selectedLanguage,
      'filter' : _selectedFilter,
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;




    return WillPopScope(onWillPop: _onWillPop,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LanguageManager().translate('configuration')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LanguageManager().translate('language'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: [
                DropdownMenuItem(
                    value: 'en',
                    child: Text(LanguageManager().translate('language_english'))
                ),
                DropdownMenuItem(
                    value: 'es',
                    child: Text(LanguageManager().translate('language_spanish'))
                ),
              ],
              onChanged: (newValue) {
                if(newValue != null) _changeLanguage(newValue);
              },
            ),
            SizedBox(height: 20,),
            Text(LanguageManager().translate('sort_products'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedFilter,
              items: [
                DropdownMenuItem(
                  value : 'title',
                  child: Text(LanguageManager().translate('sort_by_alphabetic')),
                ),
                DropdownMenuItem(
                  value : 'price',
                  child: Text(LanguageManager().translate('sort_by_price')),
                ),
                DropdownMenuItem(
                  value : 'rating',
                  child: Text(LanguageManager().translate('sort_by_rating')),
                ),
                DropdownMenuItem(
                  value : 'favorites',
                  child: Text(LanguageManager().translate('sort_by_favorites')),
                )

              ],
              onChanged: (newValue) {
                if(newValue != null) _changeFilter(newValue);
              },
            ),
            const SizedBox(height: 20,),
            const Divider(),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 48.0),
              ),
              onPressed: () {
                Navigator.of(context).pop({
                  'language' : _selectedLanguage,
                  'filter' : _selectedFilter,
                });
              },
              child: Text(
                '${LanguageManager().translate('back')}',
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );


  }
}