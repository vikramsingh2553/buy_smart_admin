import 'package:buy_smart_admin/Auth/ui/login_screen.dart';
import 'package:buy_smart_admin/Product/ui/starting_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buy_smart_admin/Auth/model/auth_model.dart';
import 'package:buy_smart_admin/Auth/service/auth_service.dart';
import 'package:buy_smart_admin/Product/ui/product_screen.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> login(
      String username, String password, BuildContext context) async {
    _setLoading(true);

    AuthModel user = AuthModel(username: username, password: password);
    AuthService apiService = AuthService();

    var response = await apiService.login(user);

    _setLoading(false);

    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      _isLoggedIn = true;
      notifyListeners();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    } else {
      _showError(context);
    }
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    _isLoggedIn = false;
    notifyListeners();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartingHomeScreen()),
    );
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

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }
}
