import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;
  final String authToken;

  ApiService({required this.baseUrl, required this.authToken});

  Future<Map<String, dynamic>> getUserProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/profile'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/users'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => user as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
