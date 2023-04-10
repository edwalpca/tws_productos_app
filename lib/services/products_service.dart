import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tsw_productos_app/models/models_export.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  //
  //
  final String _baseURL = 'fluttercrud-f51d5.firebaseio.com';
  final List<Product> productos = [];
  bool isLoading = true;
  bool isSaving = false;
  //
  //
  //Late le dice a la variable que cuando sea llamada o invocada  contendra el valor.
  late Product selectedProduct;
  //
  // Tiene que se relacionado con el paquete de import 'dart:io';
  File? newPictureFile;

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
    //
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
      await createProducto(producto);
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

    //final decodeData = resp.body;
    //

    //Actualizacion del Elemento en el Arreglo de Productos.
    //Esto es una busqueda por el indice que ocupo actualizar.
    //Es un mecanismo muy eficiente para evitar un for.
    final index = productos.indexWhere((element) => element.id == product.id);
    productos[index] = product;

    // Le ponemos el signo al final para que idicarle al Dart que siempre viene un valor confiable.
    return product.id!;
  }

  //Metodo para Crear el Nuevo Producto en mi Firebase.
  Future<String> createProducto(Product product) async {
    //https://fluttercrud-f51d5.firebaseio.com/productos/ABC123.json

    final url = Uri.https(_baseURL, 'productos.json');

    final resp = await http.post(url, body: product.toRawJson());

    final decodeData = json.decode(resp.body);

    //Recogemos la repsueta  de FireBase ya que me devuelve el ID del producto que creo en el sistema
    product.id = decodeData[
        'name']; //Devuelve un identificador unico al crearlo en Firebase

    // y ahora si como tengo la estructura de mi producto completa lo que hago es
    //Agregarla al arreglo
    productos.add(product);

    // Le ponemos el signo al final para que idicarle al Dart que siempre viene un valor confiable.
    return product.id!;
  }

  //Metodo intermedio para mostrar la imagen seleccionada por la camara
  void updateSelectedProductImage(String path) {
    //
    //
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    //Para que actualizar los Widgets con el nuevo contenido.
    notifyListeners();
  }

  // Metodo que se encargara de subir la imagen el Cluodinary
  Future<String>? uploadImage() async {
    if (newPictureFile == null || newPictureFile == "") {
      return '';
    }

    this.isSaving = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/ticosoftweb/image/upload?upload_preset=ueelkqkk');
    final imageUploadRequest = http.MultipartRequest('POST', url);

    final fileimage =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(fileimage);

    //Disparamos la peticion al server
    //En este caso hacemos el envio a Cloudinary.
    final streamResponse = await imageUploadRequest.send();
    //para recoger la respuesta de la peticion realizada.
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo Salio mal subiendo la imagen a Cludinary');
      return '';
    }

    newPictureFile = null;

    final decodeData = json.decode(resp.body);
    final urlImagen = decodeData['secure_url'];
    return urlImagen;
  }
}
