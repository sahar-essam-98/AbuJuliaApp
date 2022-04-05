import 'package:abu_julia/controllers/fb_firestore_controller.dart';
import 'package:abu_julia/models/categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<Categories> categories = [];

  CategoryProvider.initialize() {
    loadCategories();
  }

  loadCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
