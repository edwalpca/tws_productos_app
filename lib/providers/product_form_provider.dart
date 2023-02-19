import 'package:flutter/cupertino.dart';

import '../models/models_export.dart';

class ProductFormProvider extends ChangeNotifier {
  //
  //
  //
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Product producto;

  //Recibe la copia del producto selecionado porque si no es asi, estaria haciendol cambios a los valores
  // de la posicion X o Y del arreglo de productos
  ProductFormProvider(this.producto);

  bool isValidForm() {

    
    print(producto.name);
    print(producto.price);
    print(producto.available);

    return formkey.currentState?.validate() ?? false;
  }

  //Metodo para cuando el valor del check Disponible actualice el
  //Widget para que se redibuje
  updateAvailability(bool value) {
    producto.available = value;
    notifyListeners();
  }
}
