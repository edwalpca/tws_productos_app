import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  
  final String? urlImage;

  const ProductImage({
    Key? key,
    this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Opacity(
          opacity: 0.7,
          child: ClipRRect(
              borderRadius: _borderRadius,
              child: getImage(urlImage)),
        ),
      ),
    );
  }

  //
  //
  //
  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: const Color.fromARGB(255, 206, 224, 206),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
        borderRadius: _borderRadius);
  }
  // Metodo Intermdio para mostrar la imagen segun el Proveedor de la misma.
  //es decir tenemos 3 escenarios,
  // 1 - donde no hay imagen
  // 2 - donde la imagen proviene de una URL.
  // 3 - donde la imagen proviene de un path del dispositivo.
  Widget getImage(String? picture) {
    if (picture == null) {
      return const Image(
          image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }

     if (picture == "") {
      return const Image(
          image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }

    if (picture.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(picture),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.fitWidth,
      );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }


}

//
// Variable para minimizar codigo.
BorderRadius _borderRadius = const BorderRadius.only(
  topLeft: Radius.circular(45),
  topRight: Radius.circular(45),
);


