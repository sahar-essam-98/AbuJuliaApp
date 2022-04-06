
import 'package:abu_julia/providers/comment.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ShowComment extends StatefulWidget {
  String id;
  // String? category;

  ShowComment(this.id, {Key? key}) : super(key: key);

  @override
  _ShowCommentState createState() => _ShowCommentState();
}

class _ShowCommentState extends State<ShowComment> {
  var commentData;
  bool isloading = false;

  // final GeneralDataController _controller = Get.put<GeneralDataController>(GeneralDataController());


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final prvider = Provider.of<CommentProvider>(context);
    prvider.loadComment(widget.id);


    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: DraggableScrollableSheet(
              initialChildSize: 0.87,
              maxChildSize: 0.87,
              minChildSize: 0.5,
              builder: (_, controller) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  child: ListView.builder(
                      itemCount: prvider.comment.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 90.w,
                                    height: 40.h,
                                    margin: EdgeInsets.only(right: 10.w),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primary.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: FittedBox(
                                      child: Text(
                                        prvider.comment[index].userName,
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'na', fontSize: 16.sp),
                                      ),
                                    ),

                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30.h),
                                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                                    decoration: BoxDecoration(color: primary.withOpacity(0.3), borderRadius: BorderRadius.circular(25.r)),
                                    width: double.infinity,
                                    height: 60.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center ,
                                      child: Text(
                                        prvider.comment[index].content,
                                          // Provider.of<CommentProvider>(context, listen: false).loadComment();,
                                        textAlign: TextAlign.right,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 12.sp, fontFamily: 'na'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          );
  }
}
