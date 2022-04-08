import 'package:abu_julia/providers/product.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Text(
                  '>> تفاصيــل أكثــر عن الوصفــة <<',
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'هذه الوصفة مقدمة من الشيف ',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    prvider.singleProduct.chefName,
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: primary),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تعتبــر هــذه الوصفـــة ',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    prvider.singleProduct.type,
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: primary),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عدد السعرات الحرارية ',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${prvider.singleProduct.cal} سعر ',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: primary),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Image.asset('assets/chef.png', height: 150.h, width: 150.w,fit: BoxFit.cover,),
            ],
          ),
        ),
      ),
    );
  }
}
