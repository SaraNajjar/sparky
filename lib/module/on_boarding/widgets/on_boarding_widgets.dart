import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/on_boarding/on_boarding_model.dart';
class OnBoardingItem extends StatelessWidget {
  OnBoardingModel onboardingModel;
  PageController controller;
  int count;
  OnBoardingItem(this.onboardingModel,{required this.controller,required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350.h,
              width: 238.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius200.r),
                  image: DecorationImage(
                      image: ExactAssetImage( '${onboardingModel.image}',),fit: BoxFit.cover
                  )

              ),

            ),

            DefaultSpacer(height: AppSizes.space16.h),
            Text(
              '${onboardingModel.title.tr}',
              style: context.theme.textTheme.bodyText1,
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              '${onboardingModel.description.tr}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: Color(0xffA5A5A5)),
              textAlign: TextAlign.center,
            ),
            DefaultSpacer(height: AppSizes.space32.h),
          ],
        ),
      ],
    );
  }
}
