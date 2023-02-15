import 'package:flutter/material.dart';


class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: const  FadeInImage(
            image: NetworkImage('https://via.placeholder.com/400x300/green'), 
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
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
        color: Colors.green,
        boxShadow: [

          BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5)
        )
          
        ] ,
        borderRadius: _borderRadius
      );
  }
}



//
// Variable para minimizar codigo.
BorderRadius _borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),            
);