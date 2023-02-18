import 'package:flutter/material.dart';

//
//
//
//
class AuthBackGround extends StatelessWidget {
  //
  //
  //
  final Widget child;
  //
  //
  const AuthBackGround({super.key, required this.child});
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        //
        children: [
          //
          //Recuadro superior de la pantalla de Login.
          _PurpleBox(),
          //ubicacion del Logo de la pantalla en el cual utilizo un icono
          // a gran escala
          const _HeaderIcon(),
          //
          //
          child,
        ],
      ),
    );
  }
}

//
//
//
class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin_circle,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  
  //const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //Uso el media Query para capturar las dimensiones de las pantallas y en funcion de
    //eso manejar por porcentajes los bloques
    final size = MediaQuery.of(context).size;
    //
    //
    return Container(
      width: double.infinity,
      // un 40% de la pantalla.
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        //
        //
        //
        children:  [
          //Dibujo las Burbujas en el Header
          //Burbujas
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: _Bubble(),
          ),
          Positioned(
            top: -10,
            left: 160,
            child: _Bubble(),
          ),
          Positioned(
            top: 190,
            left: 130,
            child: _Bubble(),
          ),
          Positioned(
            top: 120,
            left: 250,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

//
//
//
//Widget que voy a utilizar para Dibujar las Burbujas.
class _Bubble extends StatelessWidget {
  //
  //const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
