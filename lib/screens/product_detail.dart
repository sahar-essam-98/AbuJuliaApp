import 'package:abu_julia/widgets/add_visitor_comment.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:abu_julia/widgets/show_visitor_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  double rating = 0;


  void initState() {
    Future.delayed(Duration.zero, () async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'assets/s3.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'بيتــزا الريحان',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
            Center(
              child: RatingBar.builder(
                minRating: 1,
                onRatingUpdate: (rating){
                  setState(() {
                    this.rating= rating;

                  });
                },
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 5,
                ),
              ),
            ),
            Text(
              'المقاديــر',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
            ),
            Text(
              'بندورة، دقيق، ريحان، زيتون، ملح، زيت زيتون، فطر، جبنة',
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
              'اعجن العجينة وضعها في الصينية\n'
              'ضع3/4 كوب صوص وافرده جيدا على العجين \n'
              'ضع الجبن فوق الصوص ثم ضع شرائح الطماطم'
              ' \nضع التوابل المفضلة فوق الطماطم'
              'ضع الصينية في الفرن لمدة 12 دقيقة \n',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 5.h,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 45),
                  primary: const Color(0xff0163BE),
                  backgroundColor: primary,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'video_screen');
                },
                child: const Text(
                  'مشاهـدة االفيديـو',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 145.w,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 35),
                        primary: const Color(0xff0163BE),
                        backgroundColor: primary,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => ShowComment(),);
                        // builder: (context) => ShowVisitorComment(),
                        // );
                      },
                      child: const Text(
                        'مشاهـدة التعليقات',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Container(
                    width: 145.w,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 35),
                        primary: const Color(0xff0163BE),
                        backgroundColor: primary,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => AddComment());
                        // builder: (context) => AddVisitorComment(),
                        // );
                      },
                      child: const Text(
                        'أضف تعليق',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
