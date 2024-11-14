import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(RouteInformation routeInformation) async {

    final uri = Uri.parse(routeInformation.uri as String);
    //TODO Tasca 3 - Implemetar Navigator 2.0
    if(uri.pathSegments.isEmpty) return RouteSettings(name: '/');

    if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'login') return RouteSettings(name: '/login');

    //if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'login') return RouteSettings(name: '/login');

    //if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'login') return RouteSettings(name: '/login');

   // if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'login') return RouteSettings(name: '/login');
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration)
  {
    //TODO Tasca 3 - Implemetar Navigator 2.0
    return null;
  }
}