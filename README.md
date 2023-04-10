# tsw_productos_app

Proyecto de actualizacion Profesional de un CRUD en Flutter consumiendo un WebService RestFull con Firebase de Productos.

El proyecto contiene las siguientes funcionalidades:

- Un pantalla de Login
- Una pantalla de loadingScreen.
- Una pantalla de Listado de Productos.
- Una pantalla de Agregar Productos.
- Una pantalla de Editar Productos.
- Manejo de Camara para subir imagenes.
- Manejo de FileUploads con Cloudinary.


## Informacion de la Tecnologia.

Esto es un Proyecto en Flutter, para mas inforamacion.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Gestion de Paquetes utilizados en Flutter.

- http: ^0.13.5
- provider: ^6.0.5
- image_picker: ^0.8.7+1


## Informacion Adicional del Proyecto

Integrado con Firebase con la cuenta de tic....web@gmail.com
Nombre del CRUD: https://fluttercrud......firebaseio.com/
Cloudinary fue utilizado como storage para almacenamiento de imagenes.
FileUpload API Rest
POST https://api.cloudinary.com/v1_1/demo/image/upload 


## Accesos adicionales

Para IOS en el archivo info.plis se requieren los siguientes accesos y/o valores.

	<key>NSPhotoLibraryUsageDescription</key>
	<string>Acceso a la Libreria para seleccionar Fotos</string>
	<key>NSCameraUsageDescription</key>
	<string>Necesito acceso a la camara para tomar fotos</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>Necesito acceso al microfono para grabar videos</string>	

