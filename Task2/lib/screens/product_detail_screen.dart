import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.asset(product.imagePath),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${product.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10,),
              product.price != product.original_price
              ? Text(
                '\$${product.original_price}',
                style: TextStyle(color: Colors.grey,
                    fontSize: 20, decoration: TextDecoration.lineThrough),
              )
              : Container(),

            ],
          ),
          SizedBox(height: 10),
          Text(
            product.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
