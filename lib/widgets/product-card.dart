import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  //
  //
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //
    //

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 50),
        width: double.infinity,
        height: 400,
        //color: Colors.red,
        decoration: _boxDecorationRadius(),
        child: Stack(
          children: const [_backGroundImage()],
        ),
      ),
    );
  }

  //
  //
  //
  //
  //
  BoxDecoration _boxDecorationRadius() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 8),
            blurRadius: 10,
          )
        ]);
  }
}

class _backGroundImage extends StatelessWidget {
  const _backGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: const FadeInImage(
        fit: BoxFit.contain,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('http://www.mauricioalpizar.com/wp-content/uploads/2023/02/FlutterImage-1024x576.jpeg')),
    );
  }
}
