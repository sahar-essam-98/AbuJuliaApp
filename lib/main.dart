import 'package:abu_julia/db_controller/db_controller.dart';
import 'package:abu_julia/providers/category.dart';
import 'package:abu_julia/providers/comment.dart';
import 'package:abu_julia/providers/fav_provider.dart';
import 'package:abu_julia/providers/product.dart';
import 'package:abu_julia/screens/home_screen.dart';
import 'package:abu_julia/screens/products_screen.dart';
import 'package:abu_julia/screens/favorite_screen.dart';
import 'package:abu_julia/screens/navigator_screen.dart';
import 'package:abu_julia/screens/product_detail.dart';
import 'package:abu_julia/screens/splash_screen.dart';
import 'package:abu_julia/screens/video_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  Firebase.initializeApp().then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
          ChangeNotifierProvider.value(value: ProductProvider.initialize()),
          ChangeNotifierProvider.value(value: FavProvider()),
          ChangeNotifierProvider.value(value: CommentProvider.initialize()),
          // ChangeNotifierProvider.value(value: FavProvider.initialize()),

        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        ),
      ),
    );
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
    builder: () => MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("ar"),
          ],
          locale: const Locale("ar"),
          debugShowCheckedModeBanner: false,
          initialRoute: '/Navigator_screen',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/Navigator_screen': (context) => const NavigatorScreen(),
            '/home_screen':(context)=>const HomeScreen(),
            '/favorite_screen':(context)=>const FavoriteScreen(),
            // '/profile_screen':(context)=>ProfileScreen(),
            '/products_screen':(context)=> const ProductsScreen(),
            '/product_details_dcreen':(context)=>ProductDetailsScreen(),
            'video_screen':(context)=>const VideoScreen(),
          },
        ),
      ),
    );
  }
}
