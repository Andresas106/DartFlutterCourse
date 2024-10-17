import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
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
            Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}