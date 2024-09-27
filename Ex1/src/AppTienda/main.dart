import 'dart:io';

import 'ProductoManager.dart';

void main()
{
  menu();
}

void menu(){
  var pManager = ProductoManager();
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

              print('Introduce id del producto:');
              String? id = stdin.readLineSync();
              print('Introduce nombre del producto:');
              String? nombre = stdin.readLineSync();
              print('Introduce cantidad del producto:');
              String? cantidad = stdin.readLineSync();
              print('Introduce precio del producto:');
              String? precio = stdin.readLineSync();


              if(pManager.addProducto(id, nombre, cantidad, precio))
                {
                  print('Producto introducido correctamente');
                }

          break;
        case 2:
          print('Introduce el id del producto que quieres eliminar...');
          String? id = stdin.readLineSync();
          if(pManager.deleteProducto(id)){
            print('Producto eliminado correctamente');
          }
          break;
        case 3:

          break;
        case 4:
          pManager.listarProductos();
          break;
        case 5:

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

