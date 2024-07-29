import 'dart:convert';
import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;

class ProductService {

  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } catch (e) {
        throw Exception('Failed to load products');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteProduct(String productId) async {
    final response = await http.delete(
      Uri.parse('${ApiEndpoints.product}/$productId'),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }

  Future<ProductModel> updateProduct( id, ProductModel product) async {
    final response = await http.put(
      Uri.parse('${ApiEndpoints.product}/$id'),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',


      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }
}
