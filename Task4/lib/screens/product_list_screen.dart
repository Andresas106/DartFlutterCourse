import 'package:flutter/material.dart';
import 'package:task2/local_persistence/LanguageManager.dart';
import 'package:task2/models/product.dart';
import '../data/dummy_data.dart';
import '../local_persistence/FavoritesManager.dart';
import '../local_persistence/FilterManager.dart';
import '../widgets/product_item.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';



class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();

}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> _products = dummyProducts; // Lista original de productos
  List<Product> _filteredProducts = [];
  List<String> _favoriteIds = [];

  @override
  void initState() {
    super.initState();
    _loadFilterAndProducts();
  }

  Future<void> _loadFilterAndProducts() async {
    await FilterManager().loadFilter();
    _applyFilter(FilterManager().currentFilter);
  }

  void _applyFilter(String filter){
    setState(() {
      switch(filter)
      {
        case 'alphabetic':
          _filteredProducts = [..._products]..sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'price':
          _filteredProducts = [..._products]..sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'rating':
          _filteredProducts = [..._products]..sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'favorites':

        default:
          _filteredProducts = [..._products];
      }
    });

  }

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
              itemCount: _filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (ctx, i) => ProductItem(
                _filteredProducts[i],
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
