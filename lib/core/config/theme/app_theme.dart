import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData? theme() {
    return ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff1E1E1E),
      ),
      iconTheme: const IconThemeData(color: Colors.green),
      dialogTheme:  DialogTheme(backgroundColor: const Color(0xff282A2C),shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      )),
      appBarTheme:  AppBarTheme(
          scrolledUnderElevation:0, 
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 22.sp,
            color: const Color(0xff5F33E1),
          ),
          centerTitle: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        
          style: ElevatedButton.styleFrom(
        disabledBackgroundColor:const Color(0xff282A2C),
        disabledForegroundColor: Colors.white10,
        fixedSize: const Size(double.maxFinite, 50),
        shadowColor: Colors.green,
        elevation: 4,
        
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 12, color: Colors.grey[900]))),
      hintColor: const Color(0xff838383),
      primaryColor: const Color(0xff5F33E1),
      cardColor: const Color(0xffE0E0E0),
      scaffoldBackgroundColor:  Colors.white,
      dividerColor: Colors.grey[900],
      shadowColor: Colors.black,
      highlightColor: const Color(0xffF5F5F5),
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 36,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff5F33E1),
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color:  Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Color(0xff838383),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    );
  }
}