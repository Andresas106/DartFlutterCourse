import 'package:flutter/material.dart';
import 'package:task2/local_persistence/FavoritesManager.dart';
import 'package:task2/local_persistence/LanguageManager.dart';
import 'package:task2/models/product.dart';
import '../data/dummy_data.dart';
import 'ConfigurationScreen.dart';
import '../local_persistence/FilterManager.dart';
import '../widgets/product_item.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';



class ProductListScreen extends StatefulWidget {
  @override
  ProductListScreenState createState() => ProductListScreenState();

}

class ProductListScreenState extends State<ProductListScreen> {
  List<Product> _products = []; // Lista original de productos
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    _products = await initializeProducts();
    setState(() {
    });
    _loadFilter();

}

  Future<List<Product>> initializeProducts() async {
    final favoriteIds = await FavoritesManager.getFavorites();
    return dummyProducts.map((product) {
    return Product(id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        imagePath: product.imagePath,
        originalPrice: product.originalPrice,
        isRecommended: product.isRecommended,
        rating: product.rating,
        isFavorite: favoriteIds.contains(product.id)
    );

    }).toList();
  }

  Future<void> _loadFilter() async {
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
          _filteredProducts = [..._products]..sort((a, b) => (b.isFavorite ? 1 : 0).compareTo(a.isFavorite ? 1: 0));
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
        actions: [
          IconButton(onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ConfigurationScreen(),
              ),
            );

            if (result != null) {
              setState(() {
                LanguageManager().changeLanguage(result['language']);
                FilterManager().saveFilter(result['filter']);
                loadProducts(); // Actualiza la lista con el filtro aplicado.
              });
            }
    }, icon: Icon(Icons.settings, color: Colors.white,))
        ],
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
                this
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
