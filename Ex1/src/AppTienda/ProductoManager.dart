import 'producto.dart';

class ProductoManager {
  static final ProductoManager _instance = ProductoManager._internal();

  List<Producto> productos = [];

  ProductoManager._internal();

  factory ProductoManager() {
    return _instance;
  }

  bool addProducto(String? _id, String? _nombre, String? _cantidad, String? _precio) {
    if (_id == null ||
        _nombre == null ||
        _cantidad == null ||
        _precio == null) {
      print('Un producto no  acepta nulos');
      return false;
    }

    try {
      int id_parseado = int.parse(_id);
      int cantidad_parseado = int.parse(_cantidad);
      double precio_parseado = double.parse(_precio);

      if (id_parseado <= 0 || cantidad_parseado <= 0 || precio_parseado <= 0) {
        print('Id, cantidad y precio tienen que ser mayor a 0');
        return false;
      }

      if (_nombre.isEmpty) {
        print('El nombre no puede estar vacio');
        return false;
      }

      Producto id_repetido = productos.firstWhere((p) => p.id == id_parseado,
          orElse: () => Producto(-1, "", 0, 0));

      if (id_repetido.id != -1) {
        print("El id de este producto ya existe");
        return false;
      }

      Producto p =
          Producto(id_parseado, _nombre, cantidad_parseado, precio_parseado);
      productos.add(p);
      return true;
    } catch (e) {
      print('Error al introducir el tipo de los valores del nuevo producto');
      return false;
    }
  }

  void listarProductos() {
    if (productos.length == 0) print('No hay productos introducidos');
    for (int i = 0; i < productos.length; i++) {
      print(productos.elementAt(i).toString());
    }
  }

  bool deleteProducto(String? _id){

    if(_id == null)
      {
        print("El valor del id no puede ser nulo");
        return false;
      }
    try{
      int id_parseado = int.parse(_id);
      if(!productos.any((p) => p.id == id_parseado)){
        print('Producto con id $id_parseado no encontrado');
        return false;
      }

      productos.removeWhere((p) => p.id == id_parseado);
      return true;
    }catch(e){
      print('El valor del id no es un numero');
      return false;
    }
  }
}
