import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    double discountPercentage = 0;
    if (product.price < product.original_price) {
      discountPercentage =
          ((product.original_price - product.price) / product.original_price) * 100;
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(product),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Product image
                Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                // Discount percentage on top left
                if (discountPercentage > 0)
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.red,
                      child: Text(
                        '-${discountPercentage.toStringAsFixed(0)}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.title),
                Row(
                  children: [
                    Text('\$${product.price}'),
                    SizedBox(width: 10,),
                    product.price != product.original_price

                    ? Text('\$${product.original_price}',
                    style: TextStyle(decoration: TextDecoration.lineThrough),)
                    : Container(),
                  ],
                ),
                product.isRecommended
                ? Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
                : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}