import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/product.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(RouteInformation routeInformation) async {

    final uri = routeInformation.uri;
    //TODO Tasca 3 - Implemetar Navigator 2.0
    if(uri.pathSegments.isEmpty) return RouteSettings(name: '/');
    if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'login') return RouteSettings(name: '/login');
    if(uri.pathSegments.length == 1 && uri.pathSegments[0] == 'products') return RouteSettings(name: '/products');
    if(uri.pathSegments.length == 2 && uri.pathSegments[0] == 'productDetail'){
      final productJsonString = uri.pathSegments[1];
      final product = Product.fromJsonString(productJsonString);
      return RouteSettings(name: '/productDetail', arguments: product);
    }
    return RouteSettings(name: '/');
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration)
  {
    //TODO Tasca 3 - Implemetar Navigator 2.0
    if (configuration.name == '/productDetail') {
      final product = configuration.arguments as Product;
      final productJsonString = product.toJsonString();
      return RouteInformation(uri: Uri.parse('/productDetail/$productJsonString'));
    }
    return RouteInformation(uri: Uri.parse(configuration.name ?? '/'));
  }
}