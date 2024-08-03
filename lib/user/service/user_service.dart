import 'dart:convert';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000/api';

  Future<Map<String, dynamic>> getUserProfile() async {
    final String endpoint = '$baseUrl/profile';

    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Authorization': ApiEndpoints.authToken,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Decode the response body
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      throw Exception('Failed to load user profile: $error');
    }
  }
}
