import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buy_smart_admin/Category/model/category_model.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';

class CategoryService {
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.category),
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = json.decode(response.body);
        List<CategoryModel> categories = data.map((item) => CategoryModel.fromJson(item)).toList();
        return categories;
      } catch (e) {
        print('Error parsing category data: $e');
        throw Exception('Failed to parse categories');
      }
    } else {
      print('Failed to load categories. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load categories');
    }
  }
}
