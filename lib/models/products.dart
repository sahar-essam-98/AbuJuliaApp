import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Product{
  late String id ;
  late String name ;
  late String rate ;
  late String image ;
  late String components;
  late String wayWork;
  late String category ;
  late String videoUrl;
  late bool isFavourite ;
  late String cal;
  late String type;
  late String chefName;
  late String country;



  Product.fromMap(dynamic documentMap){
    id = documentMap['id'];
    name= documentMap['name'];
    image = documentMap['image'];
    rate= documentMap['rate'];
    components= documentMap['components'];
    wayWork= documentMap['wayWork'];
    category= documentMap['category'];
    videoUrl =documentMap['videoUrl'];
    isFavourite = documentMap['isFavourite'];
    cal = documentMap['cal'];
    type = documentMap['type'];
    chefName =documentMap['chefName'];
    country = documentMap['country'];

  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['rate'] = rate;
    map['components'] = components;
    map['wayWork'] = wayWork;
    map['category'] = category;
    map['videoUrl'] = videoUrl;
    map['isFavourite'] = isFavourite;
    map['cal']=cal;
    map['type'] = type;
    map['chefName']= chefName;
    map['country'] = country;
    return map;

  }
}