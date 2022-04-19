import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/models/counrty.dart';
import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  String collection = "category";
  String collection2 = "country";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

   //get category
  Future<List<Categories>> getCategories() async {
    List<Categories> _category = [];
    QuerySnapshot query = await _firestore.collection(collection).get();

    if (query.docs.isNotEmpty) {
      query.docs.forEach((element) {
        _category.add(Categories.fromMap(element.data()));
        // print("gfh ${_category[0].name}");
      });
    }

    return _category;
  }


  //get country
  Future<List<Countries>> getCountries() async {
    List<Countries> _country = [];
    QuerySnapshot query = await _firestore.collection(collection2).get();

    if (query.docs.isNotEmpty) {
      query.docs.forEach((element) {
        _country.add(Countries.fromMap(element.data()));
        // print("gfh ${_country[0].name}");
      });
    }

    return _country;
  }

}

