import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task2/screens/product_list_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/login_screen.dart';

class AppRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  RouteSettings? _currentRoute;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RouteSettings? get currentConfiguration => _currentRoute;

  void _setNewRoutePath(RouteSettings settings) {
    _currentRoute = settings;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    _setNewRoutePath(configuration);
    return  SynchronousFuture<void>(null);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentRoute == null || _currentRoute?.name == '/')
          MaterialPage(
            child: _buildPageWithTransition(
              child: IntroScreen(),
              transitionType: 'fade',
            ),
          ),
        if (_currentRoute?.name == '/login')
          MaterialPage(
            child: _buildPageWithTransition(
              child: LoginScreen(),
              transitionType: 'fade',
            ),
          ),
        if (_currentRoute?.name == '/tienda')
          MaterialPage(
            child: _buildPageWithTransition(
              child: ProductListScreen(),
              transitionType: 'fade',
            ),
          ),
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

  Widget _buildPageWithTransition({
    required Widget child,
    required String transitionType,
  }) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          switch (transitionType) {
            case 'fade':
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            default:
              return child;
          }
        },
        child: child,
        );
    }
}