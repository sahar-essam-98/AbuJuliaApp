import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Categories {
  late String id;
  late String name;
  late String image;


  Categories.fromMap(dynamic documentMap){
    name= documentMap['name'];
    image = documentMap['image'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
      map['name'] = name;
      map['image'] = image;
      return map;

  }
}

