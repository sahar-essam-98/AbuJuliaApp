import 'package:abu_julia/controllers/fb_firestore_controller.dart';
import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/models/counrty.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<Categories> categories = [];
  List<Countries> countries =[];

  CategoryProvider.initialize() {
    loadCategories();
  }

  loadCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }

  loadCountries() async {
    countries = await _categoryServices.getCountries();
    notifyListeners();
  }
}
