import 'package:buy_smart_admin/Auth/user/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:buy_smart_admin/Auth/user/model/user_model.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService;
  List<UserModel>? _userList;

  UserProvider(this._apiService);

  List<UserModel>? get userList => _userList;

  Future<void> fetchUserProfile() async {
    try {
      final response = await _apiService.getUserProfile();
      _userList = (response['users'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }
}
