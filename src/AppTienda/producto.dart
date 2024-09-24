class Producto {
  int _id;
  String _nombre;
  int _cantidad;
  double _precio;

  Producto(this._id, this._nombre, this._cantidad, this._precio);

  int get id => _id;

  set id(int newId) {
    if (newId > 0) {
      _id = newId;
    } else {
      print('El id tiene que ser mayor a 0');
    }
  }
}
