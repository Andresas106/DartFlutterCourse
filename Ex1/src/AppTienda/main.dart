import 'dart:io';

void main()
{
  menu();
}

void menu(){
  int? numero;
  do {
    print('****************    MENU    ****************');
    print('1. Agregar producto');
    print('2. Eliminar producto');
    print('3. Actualizar producto');
    print('4. Listar todos los productos');
    print('5. Buscar producto');
    print('6. Salir');
    print('Elige opcion');
    try {
      numero = int.parse(stdin.readLineSync()!);
      switch(numero)
      {
        case 1:
          agregarProducto();
          break;
        case 2:
          eliminarProducto();
          break;
        case 3:
          actualizarProducto();
          break;
        case 4:
          listarProductos();
          break;
        case 5:
          buscarProducto();
          break;
        case 6:
          print('Saliendo del programa...');
          break;
        default:
            print('Opcion no controlada');

      }
    }catch(e)
    {
      print('El input tiene que ser un numero');
    }
  }while(numero != 6);
}

void buscarProducto() {
}

void listarProductos() {
}

void actualizarProducto() {
}

void eliminarProducto() {
}

void agregarProducto() {
  
}

