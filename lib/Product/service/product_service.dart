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
}
