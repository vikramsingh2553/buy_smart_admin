import 'package:buy_smart_admin/Auth/model/auth_model.dart';
import 'package:buy_smart_admin/Auth/service/auth_service.dart';
import 'package:buy_smart_admin/Product/ui/product_screen.dart';
import 'package:flutter/material.dart';


class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password, BuildContext context) async {
    _setLoading(true);

    AuthModel user = AuthModel(username: username, password: password);
    AuthService apiService = AuthService();

    var response = await apiService.login(user);

    _setLoading(false);

    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    } else {
      _showError(context);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed. Please try again.')),
    );
  }
}