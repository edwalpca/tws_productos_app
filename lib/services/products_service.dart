import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tsw_productos_app/models/models_export.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  //
  //
  final String _baseURL = 'fluttercrud-f51d5.firebaseio.com';
  final List<Product> productos = [];
  bool isLoading = true;
  bool isSaving = true;
  //
  //
  //Late le dice a la variable que cuando sea llamada o invocada  contendra el valor.
  late Product selectedProduct;
  //
  ProductsService() {
    //
    //Carga los productos que me suministra mi EndPoint
    cargarProductos();
    //
  }

  Future<List<Product>> cargarProductos() async {
    //
    //
    //
    print('cargarProductos...');
    isLoading = true;
    notifyListeners();
    //
    //
    //
    final url = Uri.https(_baseURL, 'productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productMap = json.decode(resp.body);
    //
    //Recorro la respuesta de mi peticion http.
    if (productMap.isNotEmpty) {
      productMap.forEach((key, value) {
        final productTemp = Product.fromJson(value);
        productTemp.id = key;
        productos.add(productTemp);
      });
    }
    isLoading = false;
    notifyListeners();
    return productos.isNotEmpty ? productos : [];
  }

  //
  //
  //
  //
  //Metodo que hace el PUT con los nuevos valores del Producto.
  Future saveOrCreateProduct(Product producto) async {
    //
    isSaving = true;
    notifyListeners();
    //
    //
    if (producto.id == null) {
      //Crea el Producto
    } else {
      // Actualiza el producto
      await updateProducto(producto);
    }
    //
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProducto(Product product) async {
    //https://fluttercrud-f51d5.firebaseio.com/productos/ABC123.json
    final url = Uri.https(_baseURL, 'productos/${product.id}.json');
    final resp = await http.put(url, body: product.toRawJson());
    final decodeData = resp.body;
    //

    //Actualizacion del Elemento en el Arreglo de Productos.
    final index = productos.indexWhere((element) => element.id == product.id);
    productos[index] = product;

    // Le ponemos el signo al final para que idicarle al Dart que siempre viene un valor confiable.
    return product.id!;
  }
}
