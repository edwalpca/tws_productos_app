import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  //
  //
  //Defini un parametro para que reciba un Widget.
  final Widget child;
  //
  //
  const CardContainer({
    Key? key, 
    required this.child
    }) : super(key: key);
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      //Crea un separacion de los lados.
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 300, //TODO: por borrar
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          //Para crear los border redondeados en las esquinas.
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              //Este se utiliza para exparsir el blur.
              blurRadius: 15,
              // la posicion de la sombra y la muevo hacia abajo
              // Incremento el valor de X se mueve hacia la derecha, si lo coloco como negativo la sombra
              // se mueve hacia la izquierda.
              //La posicion Y si aumento baja la sombra, y lo coloco con negativos la sombra sube.
              offset: Offset(0, 5),
            )
          ]);
}