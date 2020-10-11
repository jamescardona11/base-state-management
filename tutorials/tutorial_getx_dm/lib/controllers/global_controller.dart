import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/models/products.dart';

class GlobalController extends GetxController {
  List<Products> products = [];
  Map<String, Products> favorites = {};

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
  }

  Future _loadProducts() async {
    final String productsJson = await rootBundle.loadString('assets/products.json');
    products = (jsonDecode(productsJson) as List).map((json) => Products.fromJson(json)).toList();

    update(['products']);
  }

  void onFavorite(int index) {
    Products product = products[index];
    product.favorite = !product.favorite;

    if (product.favorite) {
      favorites[product.name] = product;
    } else {
      favorites.remove(product.name);
    }

    update(['products']);
  }
}
