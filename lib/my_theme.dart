import 'package:flutter/material.dart';

class MyTheme{
  static Color greenColor = const Color(0xff39A552);
  static Color textColor = const Color(0xff42505C);
  static Color lightGrayColor = const Color(0xffA3A3A3);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff000000);
  static Color blackDark = const Color(0xff303030);

  static ThemeData lightMode = ThemeData(
    // appBarTheme: AppBarTheme(
    //   backgroundColor: primaryLight,
    //   toolbarHeight: 100,
    //   elevation: 0
    // ),


    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
    )
  );

}