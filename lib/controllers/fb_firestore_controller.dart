import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  String collection = "categories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<List<Categories>> getCategories() async {
    List<Categories> _category = [];
    QuerySnapshot query = await _firestore.collection(collection).get();

    if (query.docs.isNotEmpty) {
      query.docs.forEach((element) {
        _category.add(Categories.fromMap(element.data()));
        print("gfh ${_category[0].name}");
      });
    }

    return _category;
  }
}

