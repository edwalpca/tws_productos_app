import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  
  final String urlImage;
  
  const ProductImage({
    Key? key, required this.urlImage,
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
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: _borderRadius,
            child: urlImage == "" 
            ? const Image(image: AssetImage('assets/no-image.png'),fit: BoxFit.cover,)
            : FadeInImage(
              image: NetworkImage(urlImage),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
            ) 
          ),
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
}

//
// Variable para minimizar codigo.
BorderRadius _borderRadius = const BorderRadius.only(
  topLeft: Radius.circular(45),
  topRight: Radius.circular(45),
);
