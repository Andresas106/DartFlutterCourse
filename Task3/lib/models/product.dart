import 'dart:convert';

class Product {
  final String _id;
  final String _title;
  final String _description;
  final double _price;
  final String _imagePath;
  final double _originalPrice;
  final bool _isRecommended;
  final double _rating;

  Product({
    required String id,
    required String title,
    required String description,
    required double price,
    required String imagePath,
    required double originalPrice,
    bool isRecommended = false,
    double rating = 0.0,
  })  : _id = id,
        _title = title,
        _description = description,
        _price = price,
        _imagePath = imagePath,
        _originalPrice = originalPrice,
        _isRecommended = isRecommended,
        _rating = rating;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  double get price => _price;
  String get imagePath => _imagePath;
  double get originalPrice => _originalPrice;
  bool get isRecommended => _isRecommended;
  double get discountPercentage => (((originalPrice - price) / originalPrice) * 100 );
  double get rating => _rating;

  // Convertir un objeto Product a un mapa para serialización
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'title': _title,
      'description': _description,
      'price': _price,
      'imagePath': _imagePath,
      'originalPrice': _originalPrice,
      'isRecommended': _isRecommended,
      'rating': _rating,
    };
  }

  // Crear un objeto Product desde un mapa para deserialización
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imagePath'],
      originalPrice: json['originalPrice'],
      isRecommended: json['isRecommended'],
      rating: json['rating'],
    );
  }

  // Método para convertir el objeto Product en una cadena JSON
  String toJsonString() {
    return json.encode(toJson());
  }

  // Método para crear un objeto Product desde una cadena JSON
  factory Product.fromJsonString(String jsonString) {
    return Product.fromJson(json.decode(jsonString));
  }
}