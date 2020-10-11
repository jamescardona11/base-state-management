import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.productId,
    this.name,
    this.price,
    this.description,
    this.ratingAvg,
    this.favorite = false,
  });

  int productId;
  String name;
  double price;
  String description;
  double ratingAvg;
  bool favorite;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productId: json["Product ID"],
        name: json["Name"],
        price: json["Price"].toDouble(),
        description: json["Description"],
        ratingAvg: json["Rating Avg"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Product ID": productId,
        "Name": name,
        "Price": price,
        "Description": description,
        "Rating Avg": ratingAvg,
      };
}
