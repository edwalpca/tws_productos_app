import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/providers/product_form_provider.dart';
import 'package:tsw_productos_app/services/services_export.dart';
import 'package:tsw_productos_app/ui/inputs_export.dart';
import '../widgets/widgets_export.dart';

//
//
//

class ProductScreen extends StatelessWidget {
  //
  const ProductScreen({super.key});
  //
  @override
  Widget build(BuildContext context) {
    // instancio mi Product Service para tener acceso al objeto copiado. ( duplicado.)
    final productService = Provider.of<ProductsService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

//
//
//
//
//
//
//
class _ProductScreenBody extends StatelessWidget {
  //
  //
  //
  //
  //
  //
  final ProductsService productService;

  const _ProductScreenBody({required this.productService});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Detalle Producto'),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //
              //
              Stack(
                children: [
                  //
                  //
                  ProductImage(
                      urlImage:
                          productService.selectedProduct.picture.toString()),
                  //
                  //
                  Positioned(
                      top: 60,
                      left: 20,
                      child: IconButton(
                          onPressed:() =>  Navigator.of(context ).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 40,
                            color: Colors.white,
                          ))),

                  //
                  const Positioned(
                      top: 60,
                      right: 40,
                      child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            size: 40,
                            color: Colors.white,
                          ))),
                ],
              ),
              //
              //
              //
              //
              const _ProductForm(),
              //
              //
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_as_outlined),
          onPressed: () {
            //TODO:Guadar info del formulario
          },
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
class _ProductForm extends StatelessWidget {
  //
  //
  //
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    final productForm = Provider.of<ProductFormProvider>(context);
    final producto = productForm.producto;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        //height: 200,
        decoration: _buildBoxDecoration(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              initialValue: producto.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', labelText: 'Nombre:'),
              onChanged: ((value) => producto.name = value),
              validator: ((value) {
                if (value == null || value.length < 4) {
                  return 'El Nombre del Producto es Requerido';
                }
              }),
            ),
            //
            //
            //
            const SizedBox(
              height: 20,
            ),
            //
            //
            //
            //
            TextFormField(
              initialValue: producto.price.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(hintText: 'Precio del Producto', labelText: 'Precio:'),
              inputFormatters: [
                //
                // Exprecion regular para validar un numero don un decimal.
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                //
                //
              ],    
              onChanged: ((value) {
                if (double.tryParse(value) == null) {
                  producto.price = 0.00;
                } else {
                  producto.price = double.parse(value);
                }
              }),
              validator: ((value) {
                if (value == null) {
                  return 'El Precio del Producto es Requerido';
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //
            //
            SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                title: const Text('Disponible:'),
                value: producto.available,
                onChanged: (value)=> productForm.updateAvailability(value))
          ],
        )),
      ),
    );
  }

  //
  //
  //

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5))
      ],
    );
  }
}
