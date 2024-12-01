import 'package:flutter/material.dart';
import '../local_persistence/FavoritesManager.dart';
import '../models/product.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';


class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    isFavorite = await FavoritesManager.isFavorite(widget.product.id);
    setState(() {});
  }

  Future<void> _toggleFavorite() async {
    await FavoritesManager.toggleFavorite(widget.product.id);
    setState(() {
      isFavorite = !isFavorite;
    });
    Navigator.of(context).pop(true); // Indica que el favorito ha cambiado
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.product.title,style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,)),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white,
          ),
            onPressed: _toggleFavorite)
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Container(

          ),
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
                  const Text(
                    'Producto recomendado',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                Text(
                  'Valoración: ${widget.product.rating.toStringAsFixed(1)}/5',
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
              onPressed:()
              {
                Navigator.of(context).pop();
              },
              child: Text(
                'Back',
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}