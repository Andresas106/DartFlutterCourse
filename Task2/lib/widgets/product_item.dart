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
      child: ListTile(
        leading: Image.asset(
          product.imagePath,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(product.title),
        subtitle: Text('\$${product.price}'),
      ),
    );
  }
}