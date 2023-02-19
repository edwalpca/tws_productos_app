import 'dart:convert';
import 'dart:ui';

class Product {
  //
  //
  //
  bool available;
  String name;
  String? picture;
  double price;
  String? id;
  //
  //
  Product(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id});

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  //
  //Este Codigo nos sirve para enviar la data al Servidor.

  String toRawJson() => json.encode(toJson());

  //Crea un Objeto a partir de una respuesta o MAPA JSON.
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: (json["picture"] == null) ? "" : json["picture"],
        price: (json["price"] != null)
            ? (json["price"] == "")
                ? 0.00
                : json["price"]?.toDouble()
            : 0.00,
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  //Este medoto me pemite crear una copia de la instancia de un Producto en particular
  Product copy() =>
      Product(available: available, picture: picture, name: name, price: price);
}

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

