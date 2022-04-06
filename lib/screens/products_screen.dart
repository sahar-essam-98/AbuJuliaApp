import 'package:abu_julia/providers/product.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final prvider = Provider.of<ProductProvider>(context);
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

        backgroundColor: Colors.transparent,
        elevation: 0,

        // leading: IconButton(
        //    onPressed: () {},
        //    icon: Icon(
        //      Icons.format_list_bulleted,
        //      color: black,
        //    ),
        //  ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: prvider.productsByCategory.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () async{
            await Provider.of<ProductProvider>(context,listen: false).loadProductById(productId: prvider.productsByCategory[index].id);
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
                    image: prvider.productsByCategory[index].image,
                    width: double.infinity,
                    height: 134.h,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      // gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                      //   Colors.black.withOpacity(0.8),
                      //   Colors.grey.withOpacity(0.8),
                      // ]),
                    ),
                    // color: Color(0xff0163BE).withOpacity(.4),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          prvider.productsByCategory[index].name,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'noto',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                           prvider.productsByCategory[index].rate.toString(),style: TextStyle(color: Colors.white),
                         ),
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
