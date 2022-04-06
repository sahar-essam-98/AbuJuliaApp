import 'package:abu_julia/controllers/product_srevice.dart';
import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  List<Product> productsByCategory = [];
  late Product singleProduct;
  late bool addS;

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getAllProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({required String categoryName}) async {
    productsByCategory =
    await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductById({required String productId}) async {
    singleProduct =
    await _productServices.getProductById(id: productId);
    notifyListeners();
  }
  Future addRate(String value, String rateNum) async{
    addS = (await _productServices.addRate(value, rateNum));
  }


 // likeDislikeProduct({ required Product product, required bool liked})async{
 //   if(liked){
 //     if(product.userLikes.remove(userId)){
 //       _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
 //     }else{
 //       print("THE USER WA NOT REMOVED");
 //     }
 //   }else{
 //
 //     product.userLikes.add(userId);
 //       _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
 //
 //
 //     }
 // }


}
