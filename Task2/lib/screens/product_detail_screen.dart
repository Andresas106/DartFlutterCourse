import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    double discountPercentage = 0;
    if (product.price < product.original_price) {
      discountPercentage =
          ((product.original_price - product.price) / product.original_price) * 100;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.asset(product.imagePath),
          SizedBox(height: 10),
          product.isRecommended
          ? Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Recommended',
            style: TextStyle(
                color: Colors.green[900],
                fontWeight: FontWeight.bold,
                fontSize: 16
            )),
          ) : Container(),
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
              SizedBox(width: 10,),
              product.price != product.original_price
                  ? Container(
                padding: EdgeInsets.all(2),
                color: Colors.red,
                child: Text(
                  '-${discountPercentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ) : Container(),

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
