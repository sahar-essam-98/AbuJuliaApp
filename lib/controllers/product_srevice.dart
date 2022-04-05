

import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices{

String collection = "";
FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<Product>> getAllProducts() async {
  String collection = "";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> dd =[];
  QuerySnapshot query = await _firestore.collection("product").get();

  if(query.docs.isNotEmpty){
    query.docs.forEach((element) {
      dd.add(Product.fromMap(element.data()));
      print("gfhsf ${dd[0].name}");
    });
  }

  return dd;


}

Future<List<Product>> getProductsOfCategory({required String category}) async =>
    _firestore
        .collection(collection)
        .where("category", isEqualTo: category)
        .get()
        .then((result) {
      List<Product> products = [];
      for (DocumentSnapshot product in result.docs) {
        products.add(Product.fromMap(product));
      }
      return products;
    });
}