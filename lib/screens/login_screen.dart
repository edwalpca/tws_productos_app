import 'dart:ui';

import 'package:flutter/material.dart';
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
            height: 100,
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
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                hintText: 'Email',
                labelText: 'Correo Electronico',
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: Icon(Icons.email_outlined, color: Colors.deepPurple,)
                //
                //
                ),
                
                
          ),
          TextFormField(),
        ],
      )),
    );
  }
}
