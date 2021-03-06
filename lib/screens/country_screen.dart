import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/models/counrty.dart';
import 'package:abu_julia/providers/category.dart';
import 'package:abu_julia/providers/theme.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:abu_julia/providers/product.dart';
import 'package:transparent_image/transparent_image.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late List<Countries> countryModel;

  @override
  Widget build(BuildContext context) {
    final prvider = Provider.of<CategoryProvider>(context);
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    prvider.loadCountries();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الدول',
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primary,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: primary,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Center(
                child: Image.asset(
                  'assets/chef.png',
                  width: 180.w,
                  height: 200.h,
                ),
              ),
              GestureDetector(
                onTap: () {
                  themeChanger.setTheme(ThemeData.light());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swipe,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'الوضع المضيء',
                      style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

              GestureDetector(
                onTap: () {
                  themeChanger.setTheme(ThemeData.dark());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swipe,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'الوضع المظلم',
                      style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'خــروج',
                      style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: prvider.countries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                print("hhhh ${prvider.countries[index].id}");
                await Provider.of<ProductProvider>(context, listen: false).loadProductByCountry(country: prvider.countries[index].id);
                Navigator.pushNamed(context, '/ProductByCountryScreen', arguments: {"title": prvider.countries[index].name});
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child:

                          FadeInImage.memoryNetwork(
                        image: prvider.countries[index].image,
                        width: double.infinity,
                        height: 134.h,
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      height: 134,

                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Center(
                        child: Text(
                          prvider.countries[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
