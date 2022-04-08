import 'package:abu_julia/screens/video_screen.dart';
import 'package:abu_julia/widgets/add_visitor_comment.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:abu_julia/widgets/show_visitor_comment.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/favourit.dart';
import '../providers/fav_provider.dart';
import '../providers/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double rating = 0;
  bool isadd = false;

  void initState() {
    Future.delayed(Duration.zero, () async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prvider = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          'التفاصيــل',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: FadeInImage.memoryNetwork(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: prvider.singleProduct.image,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    prvider.singleProduct.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
                  ),
                  IconButton(
                      onPressed: () async {
                        Favourie fav = Favourie(prvider.singleProduct.id, prvider.singleProduct.name, prvider.singleProduct.image);
                        setState(() async {
                          isadd = await Provider.of<FavProvider>(context, listen: false).create(fav);
                        });
                        if (isadd) {
                          print("add sucssffully");
                        }
                      },
                      icon: FavoriteButton(
                        // isFavorite: _controller.postData.value[index].isFavorite,
                        iconSize: 45.w,
                        iconColor: Colors.red,
                        valueChanged: (_isFavorite) {},
                      )),
                ],
              ),
              Center(
                child: RatingBar.builder(
                  minRating: 1,
                  onRatingUpdate: (rating) {
                    setState(() {
                      this.rating = rating;
                      prvider.addRate(prvider.singleProduct.id, rating.toString());
                    });
                  },
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: primary,
                    size: 5,
                  ),
                ),
              ),
              Text(
                'المقاديــر',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              Text(
                prvider.singleProduct.components,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'طريقة العمــل',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              Text(
                prvider.singleProduct.wayWork,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/more_details');
                  },
                  child: Text(
                    'انقــر لمزيــد مـن التفاصيــل ... ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp, color: Colors.grey.shade700),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                    minimumSize: Size(0, 45.h),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(url: prvider.singleProduct.videoUrl)));
                  },
                  child: Text(
                    'مشاهـدة الفيديـو',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 145.w,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                          minimumSize: Size(0, 35.h),
                          backgroundColor: primary,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => ShowComment(prvider.singleProduct.id),
                          );
                          // builder: (context) => ShowVisitorComment(),
                          // );
                        },
                        child: Text(
                          'مشاهـدة التعليقات',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      width: 145.w,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                          minimumSize: Size(0, 35.h),
                          primary: const Color(0xff0163BE),
                          backgroundColor: primary,
                        ),
                        onPressed: () {
                          showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context, builder: (context) => AddComment(prvider.singleProduct.id));
                          // builder: (context) => AddVisitorComment(),
                          // );
                        },
                        child: Text(
                          'أضف تعليق',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
