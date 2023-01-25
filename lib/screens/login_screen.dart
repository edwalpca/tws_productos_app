import 'package:flutter/material.dart';
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
                height: 10,
              ),
              Text(
                'Loging',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 30,
              ),
              _LoginForm(),
            ],
          )),
          const SizedBox(
            height: 50,
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
          //TODO: Mantener la referencia al KEY
          child: Column(
        children: [
          TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'info@midominio.com',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icons.email_outlined)),
          //
          const SizedBox(
            height: 30,
          ),
          //
          TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*********',
                  labelText: 'Clave de Acceso',
                  prefixIcon: Icons.password_rounded)),
          //
          const SizedBox(
            height: 30,
          ),

          MaterialButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              color: Colors.deepPurple,
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text('Ingresar',
                style: TextStyle(color: Colors.white),),
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
