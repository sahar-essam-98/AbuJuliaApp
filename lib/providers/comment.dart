import 'package:abu_julia/controllers/comment_controller.dart';
import 'package:abu_julia/controllers/fb_firestore_controller.dart';
import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/models/comments.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommentProvider with ChangeNotifier {
  CommentsServices _commentServices = CommentsServices();
  List<Comments> comment = [];
  bool isADD = false;

  CommentProvider.initialize() {
    // loadComment();
  }

  loadComment(String productId) async {
    comment = await _commentServices.getComments(productId: productId);
    notifyListeners();
  }

  addComment(Comments comment) async{
    isADD  = await _commentServices.addToCard(comment: comment);
    // notifyListeners();
  }

}