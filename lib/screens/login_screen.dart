import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tsw_productos_app/ui/inputs_export.dart';
import 'package:tsw_productos_app/widgets/widgets_export.dart';

//
//
//
//
//
//
class LoginScreen extends StatelessWidget {
  //
  //
  //
  //
  const LoginScreen({Key? key}) : super(key: key);
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackGround(
      child: SingleChildScrollView(
        // controller: controller,
        child: Column(children: [
          //
          //
          //
          //Espacio que dejo en la parte de arriba
          const SizedBox(
            height: 150,
          ),
          //
          //
          //
          CardContainer(
              child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                'Loging',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              //
              //
              //
              _LoginForm(),
              //
              //
              //
            ],
          )),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Crear una nueva Cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          //
          //
          //
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //
          //
          //
          //
          child: Column(
            //
            //
            //
            children: [
              //
              //
              //
              //
              //
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'info@midominio.com',
                    labelText: 'Correo Electronico',
                    prefixIcon: Icons.email_outlined),
                //el validator retorna el mensaje de erroe que se ven en pantalla
                //validator: (value ) => 'Esto es lo que se ve en color rojo',
                validator: (value) {
                  //
                  //
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  // value ?? '' pregunta que si viene nulo le coloca un string vacio.
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no es un arrlego';
                },
              ),
              //
              const SizedBox(
                height: 15,
              ),
              //
              //
              //
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*********',
                    labelText: 'Clave de Acceso',
                    prefixIcon: Icons.password_rounded),
                validator: (value) {
                  return ((value != null) && (value.length >= 6))
                      ? null
                      : 'La clave de contener mas de 6 caracteres';
                },
              ),
              //
              const SizedBox(
                height: 10,
              ),
              //
              //
              //
              //
              //Boton de ingreso para hacer el login.
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  color: Colors.deepPurple,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    print('Me dieron TAP');
                    //TODO: realizar el login.
                  })
              //
            ],
          )),
    );
  }
}

// String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// RegExp regExp  = new RegExp(pattern);
