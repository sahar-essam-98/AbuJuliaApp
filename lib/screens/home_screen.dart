import 'package:abu_julia/models/categories.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Categories> categoryModel;

  @override
  Widget build(BuildContext context) {
    final prvider = Provider.of<CategoryProvider>(context);
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    prvider.loadCategories();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'وصفــات أبو جوليا',
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
              SizedBox(height: 15.h,),
              // Divider(
              //   indent: 30,
              //   endIndent: 30,
              //   color: Colors.white,
              // ),
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
              SizedBox(height: 15.h,),
              // Divider(
              //   indent: 30,
              //   endIndent: 30,
              //   color: Colors.white,
              // ),
              Row(
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
              // Divider(
              //   indent: 30,
              //   endIndent: 30,
              //   color: Colors.white,
              // ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: prvider.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                print("hhhh ${prvider.categories[index].id}");
                await Provider.of<ProductProvider>(context, listen: false).loadProductsByCategory(categoryName: prvider.categories[index].id);
                Navigator.pushNamed(context, '/products_screen', arguments: {"title": prvider.categories[index].name});
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child:
                          // Image.asset(
                          //   'assets/s.jpg',
                          FadeInImage.memoryNetwork(
                        image: prvider.categories[index].image,
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
                      // height: 150,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Center(
                        child: Text(
                          prvider.categories[index].name,
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
