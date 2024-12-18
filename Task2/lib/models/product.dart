class Product {
  final String _id;
  final String _title;
  final String _description;
  final double _price;
  final double _original_price;
  final String _imagePath;
  final bool _isRecommended;
  final double _rating;

  Product({
    required String id,
    required String title,
    required String description,
    required double original_price,
    required double price,
    required String imagePath,
    required bool isRecommended,
    required double rating
  })  : _id = id,
        _title = title,
        _description = description,
        _original_price = original_price,
        _price = price,
        _imagePath = imagePath,
        _isRecommended = isRecommended,
        _rating = rating;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  double get original_price => _original_price;
  double get price => _price;
  String get imagePath => _imagePath;
  bool get isRecommended => _isRecommended;
  double get rating => _rating;
}