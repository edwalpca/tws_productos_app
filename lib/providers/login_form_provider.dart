import 'package:flutter/material.dart';

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
  //
  //
  bool isValidForm(){
    //
    //
    //
    print(formkey.currentState?.validate());
    //
    //
    return formkey.currentState?.validate() ?? false;
  }
  


}
