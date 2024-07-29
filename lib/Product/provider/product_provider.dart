import 'package:flutter/material.dart';
import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
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
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(ProductModel product) async {
    _isLoading = true;
    notifyListeners();
    try {
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
      } else {
        throw Exception('Failed to add product');
      }
    } catch (error) {
      print('Error adding product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String productId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.delete(
        Uri.parse('${ApiEndpoints.product}/$productId'),
        headers: {
          'Authorization': 'Bearer ${ApiEndpoints.authToken}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        _products.removeWhere((product) => product.id == productId);
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (error) {
      print('Error deleting product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProduct( Id, ProductModel product) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.put(
        Uri.parse('${ApiEndpoints.product}/$Id'),
        headers: {
          'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        },
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 200) {
        final updatedProduct = ProductModel.fromJson(json.decode(response.body));
        final index = _products.indexWhere((p) => p.id == Id);
        if (index != -1) {
          _products[index] = updatedProduct;
        }
      } else {
        throw Exception('Failed to update product');
      }
    } catch (error) {
      print('Error updating product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
