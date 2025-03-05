import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shoptreo_v1/model/products.dart';

class ProductProvider with ChangeNotifier{

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    _products = data.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }

  Product getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }

}