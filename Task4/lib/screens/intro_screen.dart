import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/local_persistence/LanguageManager.dart';

import 'package:task2/navigation/AppRouterDelegate.dart';
import 'package:task2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      String language = prefs.getString('language') ?? 'en';
      LanguageManager().loadTranslations(language);
    });
  }

  /*Future<void> _saveLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', LanguageManager().currentLanguage);
  }*/

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 48.0,
            left: 16.0,
            right: 16.0,
            child: Text(
              '\n${LanguageManager().translate('title')}',
              //'\nShopping Application',
              textAlign: TextAlign.center,
              style: textTheme.displayLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48.0),
                  ),
                  onPressed: ()
                  {
                    final routerDelegate = Router.of(context).routerDelegate as AppRouterDelegate;
                    routerDelegate.setNewRoutePath(RouteSettings(name: '/login'));
                  },
                  child: Text(
                    '${LanguageManager().translate('login')}',
                    style: textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48.0),
                  ),
                  onPressed: ()
                  {
                    final routerDelegate = Router.of(context).routerDelegate as AppRouterDelegate;
                    routerDelegate.setNewRoutePath(RouteSettings(name: '/tienda'));

                  },
                  child: Text(
                    '${LanguageManager().translate('guest')}',
                    style: textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}