import 'package:flutter/material.dart';

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
  }

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
              '\nShopping Application',
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

                    //TODO Tasca 3 - Implemetar Navigator 2.0
                    //Ir a la pantalla de login_screen.dart
                    final routerDelegate = Router.of(context).routerDelegate;
                    routerDelegate.setNewRoutePath(RouteSettings(name: '/login'));

                  },
                  child: Text(
                    'Login',
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

                    //TODO Tasca 3 - Implemetar Navigator 2.0
                    //Ir a la pantalla de product_list_screen.dart
                    final routerDelegate = Router.of(context).routerDelegate;
                    routerDelegate.setNewRoutePath(RouteSettings(name: '/products'));

                  },
                  child: Text(
                    'Shop as a Guest',
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
