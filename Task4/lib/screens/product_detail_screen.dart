import 'package:flutter/material.dart';
import 'package:task2/screens/ConfigurationScreen.dart';
import 'package:task2/screens/product_list_screen.dart';
import '../local_persistence/FilterManager.dart';
import '../local_persistence/LanguageManager.dart';
import '../local_persistence/FavoritesManager.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final ProductListScreenState parentState;

  const ProductDetailScreen(this.product, this.parentState, {super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  void initState() {
    super.initState();

  }

  Future<void> _toggleFavorite(Product product) async {
    product.isFavorite = !product.isFavorite;
    await FavoritesManager.toggleFavorite(product.id);
    setState(() {});
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(widget.product.isFavorite);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.product.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(onPressed: () async {
              final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ConfigurationScreen(),
                  ),
              );

              if(result != null)
                {
                  setState(() {
                    LanguageManager().changeLanguage(result['language']);
                    FilterManager().saveFilter(result['filter']);
                    // Si necesitas actualizar los productos basados en el filtro.
                    widget.parentState.loadProducts();
                  });
                }
            }, icon: Icon(Icons.settings, color: Colors.white,)),
            IconButton(
                icon: Icon(
                  widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.product.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () => _toggleFavorite(widget.product))
          ],
          backgroundColor: Colors.deepPurple,
        ),
        body: Stack(children: [
          Container(),
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  widget.product.imagePath,
                  width: 300, // Cambia este valor al tamaño deseado
                  height: 300, // Cambia este valor al tamaño deseado
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                  ),
                ),
                Text(
                  '\$${widget.product.originalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  '-${widget.product.discountPercentage.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 18, color: Colors.yellow[700]),
                ),
                if (widget.product.isRecommended)
                   Text(
                    '${LanguageManager().translate('product_recommended')}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                Text(
                  '${LanguageManager().translate('rating')}: ${widget.product.rating.toStringAsFixed(1)}/5',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
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
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                '${LanguageManager().translate('back')}',
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
