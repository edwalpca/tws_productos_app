import 'package:flutter/material.dart';
import 'package:tsw_productos_app/screens/screens_export.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  //
  //
  //
  const MyApp({super.key});
  //
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos Screeen',
      initialRoute: 'login',
      routes: {
        'login' : ( _ ) => const LoginScreen(),
        'home'  : ( _ ) => const HomeScreen(),
      },
      //Realizo una copia del tema de todos sus valores
      //pero unicamente modifica el background del Scaffold.
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}
