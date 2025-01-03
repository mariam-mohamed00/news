import 'package:flutter/material.dart';

class MyTheme {
  static Color greenColor = const Color(0xff39A552);
  static Color textColor = const Color(0xff42505C);
  static Color lightGrayColor = const Color(0xffA3A3A3);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff000000);
  static Color blackDark = const Color(0xff303030);
  static Color redColor = const Color(0xffC91C22);
  static Color blueColor = const Color(0xff003E90);
  static Color pinkColor = const Color(0xffED1E79);
  static Color brownColor = const Color(0xffCF7E48);
  static Color cyanColor = const Color(0xff4882CF);
  static Color yellowColor = const Color(0xffF2D352);

  static ThemeData lightMode = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: greenColor,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: whiteColor),
        titleMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
      ));
}
