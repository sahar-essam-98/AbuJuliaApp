

import 'package:abu_julia/models/comments.dart';
import 'package:abu_julia/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CommentsServices{

  String collection = "comments";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<List<Comments>> getComments({required String productId}) async =>
      _firestore
          .collection(collection)
          .where("product", isEqualTo: productId)
          .get()
          .then((result) {
        List<Comments> comments = [];
        for (DocumentSnapshot product in result.docs) {
          comments.add(Comments.fromMap(product));
        }
        return comments;
      });


  Future<bool> addToCard({required Comments comment}) async {
    try {


      DocumentReference ref = await _firestore.collection("comments").doc();
      comment.id = ref.id;
      // CartItemModel item = CartItemModel.(cartItem);
      ref.set(comment.toMap()).then((value) => true);



      return true;
      // CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
//       print("CART ITEMS ARE: ${cart.toString()}");
      // _userServicse.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
}