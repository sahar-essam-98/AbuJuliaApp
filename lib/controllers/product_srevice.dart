

import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices{

String collection = "Product";
FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<Product>> getAllProducts() async {
  // String collection = "";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> dd =[];
  QuerySnapshot query = await _firestore.collection(collection).get();

  if(query.docs.isNotEmpty){
    query.docs.forEach((element) {
      dd.add(Product.fromMap(element.data()));
      // print("gfhsf ${dd[0].name}");
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


Future<List<Product>> getProductsOfCountry({required String country}) async =>
    _firestore
        .collection(collection)
        .where("country", isEqualTo: country)
        .get()
        .then((result) {
      List<Product> products = [];
      for (DocumentSnapshot product in result.docs) {
        products.add(Product.fromMap(product));
      }
      return products;
    });


Future<Product> getProductById({required String id}) async =>
    _firestore
        .collection(collection)
        .doc(id)
        .get()
        .then((result) {
      // List<Product> products = [];
      // for (DocumentSnapshot product in result.docs) {
      // Product.fromMap(product));
      // }
      return Product.fromMap(result);
    });

Future<bool> addRate(String value,String rateNum) async {
  try {
    await _firestore.collection(collection).doc(value).update({"rate": rateNum}).then((value) => true);
    return true;
  } catch (e) {
    print("THE ERROR ${e.toString()}");
    return false;
  }
}

}