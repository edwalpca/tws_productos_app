import 'package:flutter/material.dart';

import '../models/models_export.dart';

class ProductCard extends StatelessWidget {
  //
  final Product producto;
  //
  //
  const ProductCard({super.key, required this.producto});

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
          //
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            //
            //

            _BackGroundImage(producto: producto),
            //
            //
            //
            _ProductDetails(producto: producto),
            //
            //
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(
                  producto: producto,
                )),
            //
            //
            //
            if (!producto.available)
              const Positioned(top: 0, left: 0, child: _BoxDisponible()),
          ],
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

//
//
//
//
class _BoxDisponible extends StatelessWidget {
  const _BoxDisponible({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 120,
      decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: const FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No Disponible',
              style: TextStyle(fontSize: 15),
            ),
          )),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final Product producto;

  const _PriceTag({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: const EdgeInsets.only(top: 12, left: 12),
        width: 100,
        height: 70,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(25))),
        // Permite al Texto adaptarse al Widget como lo hace la imagen.
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              producto.price.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}

//
//
//
//
//
class _ProductDetails extends StatelessWidget {
  //

  final Product producto;

  //
  //
  const _ProductDetails({
    Key? key,
    required this.producto,
  }) : super(key: key);

  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(producto.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('SKU: ${producto.id}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}

//
//
//
//

class _BackGroundImage extends StatelessWidget {
  //
  //
  final Product producto;

  const _BackGroundImage({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // Colocarmos este Widget para que la imagen al tener el BoxFit.cover las esquinas
    // se redondeen.
    //
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: 
        (producto.picture == '')
        ? const Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover,)
        : FadeInImage(
            fit: BoxFit.fitWidth,
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(producto.picture.toString())
        ),
      ),
    );
  }
}