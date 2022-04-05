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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        title: Text('Settings',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black)),
      ),
      body: ListView(
        children: [



          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.policy),
                  Text(
                    'الخصوصية',
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
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          )
        ],
      ),
    );
  }

}