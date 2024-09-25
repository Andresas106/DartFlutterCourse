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

  String get nombre => _nombre;

  set nombre(String newNombre){
    if(newNombre.isNotEmpty){
      _nombre = newNombre;
    }
    else{
      print('El nombre no puede estar vacio');
    }
  }

  int get cantidad => _cantidad;

  set cantidad(int newCantidad){
    if(newCantidad > 0){
      _cantidad = newCantidad;
    }
    else{
      print('La cantidad tiene que ser mayor a 0');
    }
  }

  double get precio => _precio;

  set precio(double newPrecio){
    if(newPrecio > 0){
      _precio = newPrecio;
    }
    else
      {
        print('El precio tiene que ser mayor a 0');
      }
  }

  @override
  String toString() {
    String str = 'id: $_id, nombre: $_nombre, Cantidad: $_cantidad, Precio: $_precio';
    return str;
  }
}
