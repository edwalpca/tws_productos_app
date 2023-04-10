import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/screens/products_screen.dart';
import 'package:tsw_productos_app/screens/screens_export.dart';
import 'package:tsw_productos_app/services/products_service.dart';

void main() => runApp(const AppState());

//
//
class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Por defecto el ChangeNotifierProvider el Lazy viene en true y no lo llama.
        ChangeNotifierProvider(create: (_) => ProductsService())
      ],
      child: const MyApp(),
    );
  }
}

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
      debugShowCheckedModeBanner: false,
      title: 'Productos Screeen',
      initialRoute: 'login',
      routes: {
        'login'   : ( _ ) => const LoginScreen(),
        'home'    : ( _ ) => const HomeScreen(),
        'product' : ( _ ) => const ProductScreen()
      },
      //Realizo una copia del tema de todos sus valores
      //pero unicamente modifica el background del Scaffold.
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
          
        )
      ),
    );
  }
}
