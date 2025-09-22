import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t3_shopping_list/models/product.dart';

// TODO Act2: Se añaden las nuevas variables para ordenar la lista
enum OrderBy {id, name, category, price, measureUnit, discount, iva, calories}

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
  // TODO Act1: Devuelve un ProductsData creado a partir de una lista que contiene únicamente los productos seleccionados
  ProductsData getSelectedProducts() => ProductsData._(_products.where((product) => product.isSelected).toList());
  // TODO Act1: Calcula el precio total de los productos sumando iterativamente el resultado de multiplicar el precio por las unidades de cada uno
  // TODO Act2: Utiliza el getter con el precio final del producto
  double getTotalPrice() => _products.fold(0, (value, product) => value += product.finalPrice * product.units);

  static Future<String> loadJson(BuildContext context, String file) async {
    await Future.delayed(const Duration(seconds: 2));
    return await DefaultAssetBundle.of(context).loadString(file);
  }

  // TODO Act2: Ordena la lista de productos de la instancia actual
  void orderBy(OrderBy value) {
    _sortList(_products, value);
  }

  static void _sortList(List<Product> list, OrderBy orderBy) {
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
      // TODO Act2: Se añaden las nuevas variables para ordenar la lista
      case OrderBy.measureUnit:
        list.sort((prodA, prodB) => prodA.measureUnit.compareTo(prodB.measureUnit));
        break;
      case OrderBy.discount:
        list.sort((prodA, prodB) => prodA.discount.compareTo(prodB.discount));
        break;
      case OrderBy.iva:
        list.sort((prodA, prodB) => prodA.iva.compareTo(prodB.iva));
        break;
      case OrderBy.calories:
        list.sort((prodA, prodB) => prodA.calories.compareTo(prodB.calories));
        break;
    }
  }
}