import 'package:flutter/material.dart';
import 'package:task2/navigation/AppRouteInformationParser.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';
//import 'package:task2/screens/login_screen.dart';
//import 'package:task2/widgets/product_item.dart';
//import 'screens/product_list_screen.dart';
//import 'screens/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // Hemos añadido el .router
      title: 'Tienda en Línea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: AppRouterDelegate(), // Instanciamos las dos clases importantes
      routeInformationParser: AppRouteInformationParser(),
      //home: IntroScreen(),
    );
  }
}
