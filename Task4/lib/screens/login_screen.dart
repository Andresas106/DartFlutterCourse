import 'package:flutter/material.dart';
import 'package:task2/local_persistence/LanguageManager.dart';
import 'package:task2/screens/product_list_screen.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'user' && password == 'password') {

      final routerDelegate = Router.of(context).routerDelegate as AppRouterDelegate;
      routerDelegate.setNewRoutePath(RouteSettings(name: '/tienda'));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${LanguageManager().translate('login_failed')}'),
            content: Text('${LanguageManager().translate('invalid')}'),
            actions: [
              TextButton(
                onPressed: ()
                {
                  Navigator.of(context).pop();
                  //TODO Tasca 3 - Implemetar Navigator 2.0
                  //Quitar el AlertDialog de la pila

                },
                child: Text('${LanguageManager().translate('ok')}'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Make sure to add the image asset in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: '${LanguageManager().translate('username')}',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '${LanguageManager().translate('password')}',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 24),

                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48.0),
                  ),
                  onPressed: () => _validateAndLogin(context),
                  child: Text(
                    '${LanguageManager().translate('login')}',
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
}
