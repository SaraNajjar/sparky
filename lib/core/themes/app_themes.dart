import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';

class AppThemes{
  final CustomDarkTheme=ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        color:  AppColors.primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.textPrimaryColor,
        selectedItemColor: AppColors.primaryColor,
        selectedIconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    buttonTheme: ButtonThemeData(
        minWidth: double.infinity,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8.r)),
        buttonColor: AppColors.primaryColor
    ),
    cardTheme: CardTheme(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius10.r),
          side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
    ),
    backgroundColor: AppColors.primaryColor,
    textTheme: TextTheme(
      // bodyText1: TextStyle(
      //   color: Colors.white,
      //   fontWeight: FontWeight.w600,
      //   fontSize: AppSizes.fontSize20.sp,
      //   fontFamily: 'Poppins',
      // ),
      // bodyText2: TextStyle(
      //     color: AppColors.primaryTextColor,
      //     fontSize: AppSizes.fontSize18.sp,
      //     fontWeight: FontWeight.w400
      // ),
      // subtitle1: TextStyle(
      //     fontSize: AppSizes.fontSize18.sp,
      //     fontWeight: FontWeight.w700,
      //     color: Colors.white
      // ),
      headline1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700
      ),
      // headline2: TextStyle(
      //   color: Colors.white,
      //   fontWeight: FontWeight.w400,
      //   fontSize: AppSizes.fontSize14.sp,
      //   fontFamily: 'Poppins',
      // ),
      // headline5: TextStyle(
      //     fontSize: AppSizes.fontSize16.sp,
      //     fontWeight: FontWeight.w400,
      //     color: AppColors.smallTextColor
      // ),
      // headline3: TextStyle(
      //   color:     AppColors.headLine3Color,
      //   fontWeight: FontWeight.w400,
      //   fontSize:  AppSizes.fontSize16.sp,),
      //
      // headline4: TextStyle(
      //   color:AppColors.greyColor,
      //   fontSize:  AppSizes.fontSize16.sp,
      //   fontWeight: FontWeight.w400,
      //
      // ),
    ),

  );
  final CustomLightTheme=ThemeData.light().copyWith(

    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize:20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    ),
    buttonTheme: ButtonThemeData(
        minWidth: double.infinity,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius10/2.r)),
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 255, 252, 252),
        selectedItemColor: AppColors.primaryColor,
        selectedIconTheme: IconThemeData(
            color: AppColors.primaryColor
        )
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius10.r),
          side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
    ),

    textTheme:  TextTheme(
      bodyText1: TextStyle(
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        fontFamily: 'Poppins',
      ),bodyText2: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400
    ),
      subtitle1: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryColor
      ),
      headline1: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
    ),
      // headline2: TextStyle(
      //   color: AppColors.primaryTextColor,
      //   fontWeight: FontWeight.w400,
      //   fontSize: AppSizes.fontSize14.sp,
      //   fontFamily: 'Poppins',
      // ),
      // headline3: TextStyle(
      //   color:     AppColors.headLine3Color,
      //   fontWeight: FontWeight.w400,
      //   fontSize:  AppSizes.fontSize16.sp,),
      //
      // headline4: TextStyle(
      //     color:AppColors.greyColor,
      //     fontSize: AppSizes.fontSize16.sp,
      //     fontWeight: FontWeight.w400
      // ),
    ),

    primaryColor: AppColors.primaryColor,

  );
}