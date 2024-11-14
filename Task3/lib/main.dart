import 'package:flutter/material.dart';
import 'package:task2/navigation/AppRouteInformationParser.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';
import 'package:task2/screens/login_screen.dart';
import 'package:task2/widgets/product_item.dart';
import 'screens/product_list_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routerInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routerInformationParser,
    );
  }
}
