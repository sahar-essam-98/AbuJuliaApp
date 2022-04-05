import 'dart:html';

import 'package:abu_julia/models/comments.dart';
import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CommentsServices{

  String collection = "comments";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<List<Comments>> getProductsOfCategory({required String productId}) async =>
      _firestore
          .collection(collection)
          .where("category", isEqualTo: productId)
          .get()
          .then((result) {
        List<Comments> comments = [];
        for (DocumentSnapshot product in result.docs) {
          comments.add(Comments.fromMap(product));
        }
        return comments;
      });
}