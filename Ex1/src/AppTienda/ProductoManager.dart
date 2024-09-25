import 'producto.dart';

class ProductoManager
{

  static final ProductoManager _instance = ProductoManager._internal();

  List<Producto> productos = [];

  ProductoManager._internal();

  factory ProductoManager()
  {
    return _instance;
  }

  bool addProducto(int? _id, String? _nombre, int? _cantidad, double _precio){
    if(_id == null || _nombre == null || _cantidad == null || _precio == null)
      {
        print('Un producto no  acepta nulos');
        return false;
      }

    Producto p = Producto(_id, _nombre, _cantidad, _precio);
    productos.add(p);
    return true;

  }

}