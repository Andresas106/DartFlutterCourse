import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda en Línea'),
      ),
      body:
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dummyProducts.length,
          itemBuilder: (ctx, i) => ProductItem(dummyProducts[i]),
          ),
    );
  }
}