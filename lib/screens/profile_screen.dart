// import 'package:flutter/material.dart';
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:abu_julia/providers/theme.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primary,
        title: Text('الاعدادات',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black)),
      ),
      body: ListView(
        children: [

          GestureDetector(
            onTap: (){
              themeChanger.setTheme(ThemeData.light());
            },
            child: Container(
              height: 110.h,
              child: Card(
                color: Colors.grey,
                margin: EdgeInsets.all(20),
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.swipe, color: Colors.white,),
                    Text(
                      'الوضع المضيء',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              themeChanger.setTheme(ThemeData.dark());
            },
            child: Container(
              height: 110.h,
              child: Card(
                color: Colors.grey,
                margin: EdgeInsets.all(20),
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.swipe),
                    Text(
                      'الوضع المظلم',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
          ),
         
          GestureDetector(
            onTap: (){
              SystemNavigator.pop();
            },
            child: Container(
              height: 110.h,
              child: Card(
                color: Colors.grey,
                margin: EdgeInsets.all(20),
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    Text(
                      'خروج',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    IconButton(
                      onPressed: (){
                        SystemNavigator.pop();
                      },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}