import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricesBadge extends StatelessWidget {
  final double original_price;
  final double price;
  final double fontSize;

  PricesBadge(this.original_price, this.price, this.fontSize);

  @override
  Widget build(BuildContext context) {
    if(original_price == price) return SizedBox.shrink();

    return Text(
        '\$${original_price}',
        style: TextStyle(color: Colors.grey,
        fontSize: fontSize, decoration: TextDecoration.lineThrough)
    );
  }
}