import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Product{
  late String id ;
  late String name ;
  late int rate ;
  late String image ;
  late String components;
  late String wayWork;
  late String category ;
  late bool isFavourite ;


  Product.fromMap(dynamic documentMap){
    name= documentMap['name'];
    image = documentMap['image'];
    rate= documentMap['rate'];
    components= documentMap['components'];
    wayWork= documentMap['wayWork'];
    category= documentMap['category'];
    isFavourite = documentMap['isFavourite'];

  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['rate'] = rate;
    map['components'] = components;
    map['wayWork'] = wayWork;
    map['category'] = category;
    map['isFavourite'] = isFavourite;
    return map;

  }
}