import 'package:buy_smart_admin/Category/model/category_model.dart';
import 'package:buy_smart_admin/Category/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  final CategoryService _categoryService;

  // Constructor to initialize the CategoryService with the authToken
  CategoryProvider(String authToken) : _categoryService = CategoryService(authToken);

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _categoryService.fetchCategories();
    } catch (error) {
      // Handle the error appropriately, e.g., log it or display a message to the user
      print('Error fetching categories: $error');
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCategory(CategoryModel category) async {
    try {
      await _categoryService.addCategory(category);
      _categories.add(category);
      notifyListeners();
    } catch (error) {
      // Handle the error appropriately, e.g., log it or display a message to the user
      print('Error adding category: $error');
      throw error;
    }
  }
}
