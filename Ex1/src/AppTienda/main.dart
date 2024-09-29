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
          print('Introduce el id de producto a modificar');
          String? id = stdin.readLineSync();
          print('Introduce nuevo nombre de producto (opcional)');
          String? nombre = stdin.readLineSync();
          print('Introduce nueva cantidad de producto (opcional)');
          String? cantidad = stdin.readLineSync();
          print('Introduce nuevo precio de producto (opcional)');
          String? precio = stdin.readLineSync();
          if(pManager.modificarProducto(id, nombre, cantidad, precio)){
            print('Producto modificado correctamente');
          }
          break;
        case 4:
          pManager.listarProductos();
          break;
        case 5:
          print('Busca un producto (id o nombre)');
          String? busqueda = stdin.readLineSync();
          var productoBuscado = pManager.buscarProducto(busqueda);
          if(productoBuscado.id == -1)
            {
              print('Productos no encontrados con el filtro dado');
            }
          else
            {
              print(productoBuscado.toString());
            }
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

