class Product {
  final String _id;
  final String _title;
  final String _description;
  final double _price;
  final String _imagePath;
  final double _originalPrice;
  final bool _isRecommended;
  final double _rating;
  bool _isFavorite;

  Product({
    required String id,
    required String title,
    required String description,
    required double price,
    required String imagePath,
    required double originalPrice,
    bool isRecommended = false,
    double rating = 0.0,
    bool isFavorite = false
  })  : _id = id,
        _title = title,
        _description = description,
        _price = price,
        _imagePath = imagePath,
        _originalPrice = originalPrice,
        _isRecommended = isRecommended,
        _rating = rating,
        _isFavorite = isFavorite;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  double get price => _price;
  String get imagePath => _imagePath;
  double get originalPrice => _originalPrice;
  bool get isRecommended => _isRecommended;
  bool get isFavorite => _isFavorite;
  double get discountPercentage => (((originalPrice - price) / originalPrice) * 100 );
  double get rating => _rating;

  set isFavorite(bool value) => _isFavorite = value;
}