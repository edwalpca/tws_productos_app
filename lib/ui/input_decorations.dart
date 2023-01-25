import 'package:flutter/material.dart';

class InputDecorations {
  //
  //
  //
  //
  //
  //
  //
  //
  //Eso es un metodo estatio.
  static InputDecoration authInputDecoration(
      {
        required String hintText, 
        required String labelText,
        IconData? prefixIcon  
        }) {
    //
    //
    //
    //
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.deepPurple,
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,//'Email',
        labelText: labelText,//'Correo Electronico',
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
          ?Icon(prefixIcon, color: Colors.deepPurple)
          : null
        //
        //
        );
  }
}
