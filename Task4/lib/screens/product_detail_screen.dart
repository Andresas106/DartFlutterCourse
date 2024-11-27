import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:task2/navigation/AppRouterDelegate.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(product.title,style: const TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,)),
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
                  product.imagePath,
                  width: 300, // Cambia este valor al tamaño deseado
                  height: 300, // Cambia este valor al tamaño deseado
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                  ),
                ),
                Text(
                  '\$${product.originalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  '-${product.discountPercentage.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 18, color: Colors.yellow[700]),
                ),
                if (product.isRecommended)
                  const Text(
                    'Producto recomendado',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                Text(
                  'Valoración: ${product.rating.toStringAsFixed(1)}/5',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.description,
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
        ],
      ),
    );
  }
}

