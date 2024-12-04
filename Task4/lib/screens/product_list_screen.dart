import 'package:flutter/material.dart';
import 'package:task2/local_persistence/LanguageManager.dart';
import '../data/dummy_data.dart';
import '../widgets/product_item.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('${LanguageManager().translate('products')}',style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: dummyProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (ctx, i) => ProductItem(
                dummyProducts[i],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 48.0),
              ),
              onPressed:()
              {
                final routerDelegate = Router.of(context).routerDelegate as AppRouterDelegate;
                routerDelegate.setNewRoutePath(RouteSettings(name: '/'));
              },
              child: Text(
                '${LanguageManager().translate('logout')}',
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
