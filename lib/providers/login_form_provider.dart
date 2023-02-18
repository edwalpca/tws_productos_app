import 'package:flutter/material.dart';

// Provider para el Login que se encarga de notificar al arbol de widget que estan escuchando

class LoginFormProvider extends ChangeNotifier {
  //
  ////
  ///
  ///
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ///
  ///
  String email = '';
  String password = '';
  //
  //
  bool _isloading = false;
  //getter que devuelve el valor de la variable y la bandera.
  bool get isloading => _isloading;
  //
  //setter del metodo
  set isloading(valor) {
    _isloading = valor;
    //
    //Realizo el broadcast a todos widget que estan escuchando.
    //
    notifyListeners();
  }

  //
  //
  bool isValidForm() {
    //
    //
    //
    //print(formkey.currentState?.validate());
    //
    //
    return formkey.currentState?.validate() ?? false;
  }
}
