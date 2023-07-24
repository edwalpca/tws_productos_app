import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tsw_productos_app/providers/product_form_provider.dart';
import 'package:tsw_productos_app/screens/screens_export.dart';
import 'package:tsw_productos_app/services/services_export.dart';
import 'package:tsw_productos_app/ui/inputs_export.dart';
import '../widgets/widgets_export.dart';
// Importacion del Paquete para gestionar imagenes.
import 'package:image_picker/image_picker.dart';
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
      // child: productService.isSaving
      //     ? const LoadingScreen()
      //     : _ProductScreenBody(productService: productService),
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
    //
    //
    final productForm = Provider.of<ProductFormProvider>(context);

    //
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
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 40,
                            color: Colors.white,
                          ))),

                  //
                  Positioned(
                      top: 60,
                      right: 40,
                      child: IconButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final PickedFile? pickedFile =
                                await picker.getImage(
                              // Dos fuentes para las imagenes
                              // ImageSource.gallery
                              // ImageSource.camera
                              source: ImageSource.camera,
                              imageQuality: 100,
                            );

                            if (pickedFile == null) {
                              print('No selecciono nada');
                            }

                            print('Tenemos una imagen: ${pickedFile?.path}');

                            //Para mostrar la imagen del producto en la pantalla
                            productService
                                .updateSelectedProductImage(pickedFile!.path);
                          },
                          icon: const Icon(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton:  FloatingActionButton(
          child: productService.isSaving  
          ?   const CircularProgressIndicator(color: Colors.white)
          :   const Icon(Icons.save_as_outlined),
          onPressed: 
          productService.isSaving 
          ? null
          : () async {
            //
            //
            print('Guardando....');

            if (!productForm.isValidForm()) return;
            //
            //Guardamos la imagen seleccionada
            final String? imageUrl = await productService.uploadImage();
            //
            //
            print('Imagen Enviada a Cloudinary:' + imageUrl!);

            if (imageUrl != ""){
              productForm.producto.picture = imageUrl;
            }

            //Se encarga de enviar al Server los nuevos Valores.
            await productService.saveOrCreateProduct(productForm.producto);
            //
            //
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
            //
            //
            //Asocio el formulario con el Provider del Formulario.
            key: productForm.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Precio del Producto', labelText: 'Precio:'),
                  inputFormatters: [
                    //
                    // Exprecion regular para validar un numero don un decimal.
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
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
                    onChanged: (value) => productForm.updateAvailability(value))
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
