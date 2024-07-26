import 'package:flutter/material.dart';
import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _products = data.map((json) => ProductModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> addProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 201) {
      _products.add(ProductModel.fromJson(json.decode(response.body)));
      notifyListeners();
    } else {
      throw Exception('Failed to add product');
    }
  }

}
