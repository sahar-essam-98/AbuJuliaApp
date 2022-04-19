import 'package:abu_julia/screens/country_screen.dart';
import 'package:abu_julia/screens/countryproduct.dart';
import 'package:abu_julia/screens/favorite_screen.dart';
import 'package:abu_julia/screens/home_screen.dart';
import 'package:abu_julia/screens/profile_screen.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int currentIndex = 0;

  final pages = [
     HomeScreen(),
    CountryScreen(),
     FavoriteScreen(),
     ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: main3,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon:Icon(Icons.home, color: primary,) ,
            icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.language, color: primary,),
            icon: Icon(Icons.language),
            label: '',
          ),
          BottomNavigationBarItem(
              activeIcon:Icon(Icons.favorite_outlined, color: Colors.red,) ,
            icon: Icon(Icons.favorite_outlined),
              label: ''
          ),
          BottomNavigationBarItem(
              activeIcon:Icon(Icons.person, color: primary,) ,
            icon: Icon(Icons.person),
              label: ''
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
      body: pages[currentIndex],
    );
  }
}
