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
}
