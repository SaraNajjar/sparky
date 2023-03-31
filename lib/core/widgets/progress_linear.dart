import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_texts.dart';

Widget progressLinear(
    {
      required double width,
      required String text,
      required Color dot1,
      required Color dot2,
      required Color dot3,
      required Color line1,
      required Color line2,
      required Color line3,
}){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.dividerColor2
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.greenColor,
                  radius: 5,
                ),
                Container(
                  height: 1,
                  width: 75,
                  color: line1,
                ),
                 CircleAvatar(
                  backgroundColor: dot1,
                  radius: 5,
                ),
                Container(
                  height: 1,
                  width: 75,
                  color: line2,
                ),
                 CircleAvatar(
                  backgroundColor: dot2,
                  radius: 5,
                ),
                Container(
                  height: 1,
                  width: 75,
                  color: line3,
                ),
                 CircleAvatar(
                  backgroundColor: dot3,
                  radius: 5,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: width,),
              Text(
                  text,
                style: const TextStyle(
                  fontFamily: AppTexts.poppinsRegular,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenColor
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}