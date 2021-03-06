

import 'package:abu_julia/models/comments.dart';
import 'package:abu_julia/providers/comment.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddComment extends StatefulWidget {
  var id;

  AddComment( this.id,  { Key? key}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {

  late TextEditingController _nameTextController;
  late TextEditingController _commentTextController;

  bool _isChecked = true;
  var data;
  bool isloading = false;
  // final GeneralDataController _controller = Get.put<GeneralDataController>(GeneralDataController());
  // addComment(_nameTextController.text,_commentTextController.text,widget.category,widget.id,_isChecked);


  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _commentTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _commentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  isloading
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
            child: Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '????????????????',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontFamily: 'na',
                          ),
                        ),
                        TextField(
                          cursorColor:Colors.black,
                          controller: _nameTextController,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black, fontFamily: 'na'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: primary, width: 1.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 5.w),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          //Normal textInputField will be displayed
                        ),
                        Text(
                          '??????????????????????????',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontFamily: 'na',
                          ),
                        ),
                        TextField(
                          cursorColor: primary,
                          controller: _commentTextController,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black, fontFamily: 'na'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: primary, width: 1.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 5.w),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          //Normal textInputField will be displayed
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10.w),
                      width: 130.w,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(0, 40.h),
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                          ),
                        ),
                        onPressed: ()async {
                          Comments comment = Comments(_nameTextController.text, _commentTextController.text, widget.id);
                          await Provider.of<CommentProvider>(context,listen: false).addComment(comment);
                          if(Provider.of<CommentProvider>(context, listen: false).isADD){
                            print("add su");
                          }
                          _nameTextController.clear();
                          _commentTextController.clear();
                          showAlertDialog(context);
                        },
                        child: Text(
                          '????????????????????',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'na',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(
            "???? ?????????? ?????????????? ??????????",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: primary),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}