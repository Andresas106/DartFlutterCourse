import 'package:flutter/material.dart';
import 'package:task2/local_persistence/LanguageManager.dart';
import '../local_persistence/FavoritesManager.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_list_screen.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> _toggleFavorite(Product product) async {
    product.isFavorite = !product.isFavorite;
    await FavoritesManager.toggleFavorite(product.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () async {
        bool? isFavoriteChanged = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(widget.product),
          ),
        );

        if(isFavoriteChanged != null && isFavoriteChanged != widget.product.isFavorite)
          {
            setState(() {
              widget.product.isFavorite = isFavoriteChanged;
            });
          }

        // Recargar productos en la lista de productos
        final parentState = context.findAncestorStateOfType<ProductListScreenState>();
        parentState?.loadProducts(); // Llamar a la función para recargar los productos
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      widget.product.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '\$${widget.product.originalPrice}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '-${((1 - (widget.product.price / widget.product.originalPrice)) * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            if (widget.product.isRecommended)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${LanguageManager().translate('recommended')}',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ),
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                  onPressed: () => _toggleFavorite(widget.product),
                  icon: Icon(widget.product.isFavorite ? Icons.favorite : Icons.favorite_border, color: widget.product.isFavorite ? Colors.red : Colors.grey)
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Text(
                '${widget.product.rating}/5',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}



