// To parse this JSON data, do
//
//     final productResModel = productResModelFromJson(jsonString);

import 'dart:convert';

ProductResModel productResModelFromJson(String str) =>
    ProductResModel.fromJson(json.decode(str));

String productResModelToJson(ProductResModel data) =>
    json.encode(data.toJson());

class ProductResModel {
  String? msg;
  List<Product>? products;

  ProductResModel({
    this.msg,
    this.products,
  });

  factory ProductResModel.fromJson(Map<String, dynamic> json) =>
      ProductResModel(
        msg: json["Msg"],
        products: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "data": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  int? stock;
  String? category;
  dynamic image;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.category,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "category": category,
        "image": image,
      };
}
