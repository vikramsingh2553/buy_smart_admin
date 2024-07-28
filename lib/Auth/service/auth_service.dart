import 'dart:convert';
import 'package:buy_smart_admin/Auth/model/auth_model.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, dynamic>?> login(AuthModel user) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(AuthModel user) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to register: ${response.statusCode}');
      return null;
    }
  }
}
