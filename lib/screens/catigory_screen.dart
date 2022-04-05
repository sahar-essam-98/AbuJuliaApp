// import 'package:abu_julia/widgets/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CategoryPizzaScreen extends StatefulWidget {
//   const CategoryPizzaScreen({Key? key}) : super(key: key);
//
//   @override
//   _CategoryPizzaScreenState createState() => _CategoryPizzaScreenState();
// }
//
// class _CategoryPizzaScreenState extends State<CategoryPizzaScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'بيتــزا',
//           style: TextStyle(color: black, fontWeight: FontWeight.bold),
//         ),
//         leading:
//           IconButton(onPressed: (){
//             Navigator.pop(context);
//           }, icon: Icon(Icons.keyboard_backspace_outlined, color: black,),),
//
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//
//         // leading: IconButton(
//         //    onPressed: () {},
//         //    icon: Icon(
//         //      Icons.format_list_bulleted,
//         //      color: black,
//         //    ),
//         //  ),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: 10,
//         itemBuilder: (_, index) => Container(
//           margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//           //clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           height: 150.h,
//           width: 150.w,
//           child: GestureDetector(
//             onTap: (){
//               Navigator.pushNamed(context, '/product_details_dcreen');
//             },
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15.r),
//                   child: Image.asset(
//                     'assets/s3.jpg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 120.h),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: black.withOpacity(0.4),
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
//                       // gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
//                       //   Colors.black.withOpacity(0.8),
//                       //   Colors.grey.withOpacity(0.8),
//                       // ]),
//                     ),
//                     // color: Color(0xff0163BE).withOpacity(.4),
//                     alignment: Alignment.center,
//                     child: Text(
//                       'بيتزا حارة',
//                       maxLines: 2,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'noto',
//                         fontSize: 16.sp,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
