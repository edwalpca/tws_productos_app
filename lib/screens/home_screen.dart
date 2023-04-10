import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/models/models_export.dart';
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
                  onTap: () {
                    //
                    //
                    //Este metodo lo que me permite crear una copia de item seleccionado.
                    //Para pasarle ese objeto al formulario de edicion y NO TOCA los valores del objeto
                    //del Arreglo.
                    productService.selectedProduct =
                        productService.productos[index].copy();
                    Navigator.pushNamed(context, 'product',
                        arguments: productService.selectedProduct);
                  },
                  child:
                      ProductCard(producto: productService.productos[index]));
              //
              //
            }),
      ),
      floatingActionButton:
          //

          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                //
                //
                final producto = Product(
                  available: false, 
                  picture: '',
                  name: '', 
                  price: 0);
                //
                productService.selectedProduct = producto;
                Navigator.pushNamed(context, 'product');
              }),
    );
  }
}
