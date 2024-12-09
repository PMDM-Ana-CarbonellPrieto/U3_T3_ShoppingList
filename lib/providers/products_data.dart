import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t3_shopping_list/models/product.dart';

enum OrderBy {id, name, category, price}

class ProductsData {
  final List<Product> _products;

  ProductsData._(this._products);

  factory ProductsData.fromJson(String jsonData, {OrderBy orderBy = OrderBy.name}) {
    Map<String, dynamic> mapJson = json.decode(jsonData);
    List<dynamic> list = mapJson['products'];
    List<Product> productsList = list.map((element) => Product.fromMap(element)).toList();
    _sortList(productsList, orderBy);
    return ProductsData._(productsList);
  }

  Product getProduct(int index) => _products[index];
  int getSize() => _products.length;

  static Future<String> loadJson(BuildContext context, String file) async {
    await Future.delayed(Duration(seconds: 2));
    return await DefaultAssetBundle.of(context).loadString(file);
  }

  static _sortList(List<Product> list, OrderBy orderBy) {
    switch(orderBy) {
      case OrderBy.id:
        list.sort((prodA, prodB) => prodA.id.compareTo(prodB.id));
        break;
      case OrderBy.name:
        list.sort((prodA, prodB) => prodA.name.compareTo(prodB.name));
        break;
      case OrderBy.category:
        list.sort((prodA, prodB) => prodA.category.compareTo(prodB.category));
        break;
      case OrderBy.price:
        list.sort((prodA, prodB) => prodA.price.compareTo(prodB.price));
        break;
    }
  }
}