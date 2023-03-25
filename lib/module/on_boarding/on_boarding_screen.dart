import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/on_boarding/on_boarding_controller.dart';
import 'package:sparky/module/on_boarding/widgets/on_boarding_widgets.dart';

class OnBoarding_Screen extends StatelessWidget {
  OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void submit() {
    //   SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
    //     if (value = true) {
    //       Get.offAndToNamed(RoutesClass.getLoginRoute());
    //
    //     }
    //   }));
    // }

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((controller) => Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            actions: [
              TextButton(
                  onPressed: () {
                    // Get.toNamed(RoutesClass.getLoginRoute());
                    // submit();
                  },
                  child: Text(
                      AppTexts.skip.tr,
                      style:  context.theme.textTheme.headline2?.copyWith(
                          color: Colors.white
                      )
                  ))
            ],
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        controller.onPageChanged(index);
                      },
                      itemBuilder: (context, index) =>
                 OnBoardingItem(controller.board[index])
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 50.h),
                child: controller.isLast != true
                    ? SmoothPageIndicator(
                  count: controller.board.length,
                  controller: controller.onboardController,
                  effect: WormEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      spacing: 11.w),
                )
                    : Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w),
                    child:
                    MaterialButton(
                      onPressed: (){
                        //submit();
                      //  Get.offAllNamed(RoutesClass.getLoginRoute());
                      },

                      child: Text(AppTexts.getStarted.tr),
                    )
                  /*DefaultButton(text: AppTexts.get_started.tr,
                                screen: RoutesClass.getLoginRoute()),*/
                ),
              )
            ],
          ),
        )));
  }
}
