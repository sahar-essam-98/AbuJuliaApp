import 'package:abu_julia/providers/product.dart';
import 'package:abu_julia/providers/theme.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductByCountryScreen extends StatefulWidget {
  const ProductByCountryScreen({Key? key}) : super(key: key);

  @override
  _ProductByCountryScreenState createState() => _ProductByCountryScreenState();
}

class _ProductByCountryScreenState extends State<ProductByCountryScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final prvider = Provider.of<ProductProvider>(context);
    print("uuuuuuuu ${prvider.productByCountry.length}");
    Map? route = ModalRoute.of(context)?.settings.arguments as Map?;
    late String title;
    if(route != null){
      title = route["title"];
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace_outlined,
            color: black,
          ),
        ),

        backgroundColor: primary,
        elevation: 0,

      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: prvider.productByCountry.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () async{
            await Provider.of<ProductProvider>(context,listen: false).loadProductById(productId: prvider.productByCountry[index].id);
            Navigator.pushNamed(context, '/product_details_dcreen');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            //clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            height: 150.h,
            width: 150.w,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child:  FadeInImage.memoryNetwork(
                    image: prvider.productByCountry[index].image,
                    width: double.infinity,
                    height: 134.h,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),

                    ),

                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          prvider.productByCountry[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'noto',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 25.w,),

                        Text(
                          prvider.productByCountry[index].rate.toString(),style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5.w,),
                        Icon(Icons.star, color: primary,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
