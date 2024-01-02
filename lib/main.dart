import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:internship/views/homepage.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnlineStore',
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: Text(
          'OnlineStore',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        //alignment: Alignment.center,
        //pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.white,
      ),
    );
    // return ScreenUtilInit(
    //   designSize: const Size(360, 690),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (context, child) {
    //     return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'OnlineStore',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //         textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    //       ),
    //       home: child,
    //     );
    //   },
    //   child: HomePage(),
    //   // child: AnimatedSplashScreen(
    //   //   duration: 2000,
    //   //   splash: Text(
    //   //     'OnlineStore',
    //   //     style: TextStyle(
    //   //       fontSize: 50.0.sp,
    //   //       fontWeight: FontWeight.bold,
    //   //       fontStyle: FontStyle.italic,
    //   //     ),
    //   //   ),
    //   //   nextScreen: HomePage(),
    //   //   splashTransition: SplashTransition.fadeTransition,
    //   //   //alignment: Alignment.center,
    //   //   //pageTransitionType: PageTransitionType.scale,
    //   //   backgroundColor: Colors.white,
    //   // ),
    // );
  }
}
