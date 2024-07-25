import 'package:flutter/material.dart';
import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/Product/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [];
  final ProductService _productService = ProductService();

  List<ProductModel> get products => _products;

  Future<void> addProduct(ProductModel product) async {
    try {
      final newProduct = await _productService.addProduct(product);
      _products.add(newProduct);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add product');
    }
  }
}
