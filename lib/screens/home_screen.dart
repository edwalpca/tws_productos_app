import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/screens/screens_export.dart';

import '../services/services_export.dart';
import '../widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Aqui es donde se invoca el llamado del Servicio.
    final productService = Provider.of<ProductsService>(context);

    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Center(
        //
        //
        //
        child: ListView.builder(
            //
            //
            itemCount: productService.productos.length,
            itemBuilder: (BuildContext context, int index) {
              //
              //
              //
              return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'product'),
                  child: ProductCard(producto: productService.productos[index]));
              //
              //
            }),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
