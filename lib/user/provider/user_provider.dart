import 'package:buy_smart_admin/user/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final ApiService apiService;

  Map<String, dynamic>? _userProfile;
  bool _isLoading = false;
  String? _errorMessage;

  UserProvider({required this.apiService});

  Map<String, dynamic>? get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _userProfile = await apiService.getUserProfile();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
