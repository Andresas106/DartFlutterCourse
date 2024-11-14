import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/intro_screen.dart';
import '../screens/login_screen.dart';

class AppRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  final GlobalKey<NavigatorState> navigatorKey;
  RouteSettings? _currentRoute;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RouteSettings? get currentConfiguration => _currentRoute;

  void _setNewRoutePath(RouteSettings settings) {
    _currentRoute = settings;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    _setNewRoutePath(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        //TODO Tasca 3 - Implemetar Navigator 2.0
        MaterialPage(key: ValueKey('IntroScreen'),
            child: IntroScreen()),
        if(_currentRoute?.name == '/login')
          MaterialPage(key: ValueKey('LoginScreen'),child: LoginScreen())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _setNewRoutePath(RouteSettings(name: '/'));
        return true;
      },
    );
  }
}