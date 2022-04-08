import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/Navigator_screen');

    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/savoring-food.json',fit: BoxFit.contain, width: 250.w, height: 250.h),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'وصفـــــــــــاتي',
              style: TextStyle( color: primary, fontSize: 30.sp, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
