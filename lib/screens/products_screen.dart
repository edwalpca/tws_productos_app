import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/services/services_export.dart';
import 'package:tsw_productos_app/ui/inputs_export.dart';
import '../widgets/widgets_export.dart';

//
//
//

class ProductScreen extends StatelessWidget {
  //
  const ProductScreen({super.key});

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
                children: const [
                  //
                  //
                  ProductImage(),
                  //
                  //
                  Positioned(
                      top: 60,
                      left: 20,
                      child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 40,
                            color: Colors.white,
                          ))),

                  //
                  Positioned(
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

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', labelText: 'Nombre:'),
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
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Precio del Producto', labelText: 'Precio:'),
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
                value: true,
                onChanged: (value) {})
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
