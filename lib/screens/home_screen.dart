import 'package:abu_julia/models/categories.dart';
import 'package:abu_julia/providers/category.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  late  Categories categoryModel;

  @override
  Widget build(BuildContext context) {


    final CatProvider = Provider.of<CategoryProvider>(context);


    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'وصفــات أبو جوليا',
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/abu.jpg'),
            ),
          )),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/products_screen');
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
                        image: categoryModel.image,

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
                        categoryModel.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
