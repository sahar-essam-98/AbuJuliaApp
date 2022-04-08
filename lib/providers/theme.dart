import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ThemeChanger extends ChangeNotifier {

  late ThemeData themeData;
  ThemeChanger({required this.themeData});

  getTheme() => themeData;

  setTheme(ThemeData theme){
    themeData= theme;
    notifyListeners();
  }
}