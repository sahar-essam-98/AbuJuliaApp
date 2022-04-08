import 'package:abu_julia/models/favourit.dart';
import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/fav_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavProvider>(context);
    provider.read();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'المفضــلة',
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
        itemCount: provider.contacts.length,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          //clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          height: 150.h,
          width: 150.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product_details_dcreen');
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    provider.contacts[index].image,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.4),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                      // gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                      //   Colors.black.withOpacity(0.8),
                      //   Colors.grey.withOpacity(0.8),
                      // ]),
                    ),
                    // color: Color(0xff0163BE).withOpacity(.4),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          provider.contacts[index].name,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'noto',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Favourie fav = Favourie(prvider.singleProduct.id,prvider.singleProduct.name,prvider.singleProduct.image);
                            setState(() async {
                              bool isRemoved = await Provider.of<FavProvider>(context, listen: false).delete(provider.contacts[index].id);
                              if(isRemoved){
                                print("add sucssffully")  ;
                              }
                            });

                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
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
