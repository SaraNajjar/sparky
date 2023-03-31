import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/services/shared_pref.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/on_boarding/on_boarding_controller.dart';
import 'package:sparky/module/on_boarding/widgets/on_boarding_widgets.dart';

class OnBoarding_Screen extends StatelessWidget {
  OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(Routes.loginRoute);

        }
      }));
    }

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((controller) => Scaffold(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: context.theme.scaffoldBackgroundColor,

                actions: [
                  Padding(
                    padding:EdgeInsets.only(right: AppSizes.padding20.w,top: AppSizes.padding20.h,left: AppSizes.padding20.w) ,
                    child: InkWell(
                      onTap: () {
                         Get.toNamed(Routes.loginRoute);
                         submit();
                      },
                      child: Text(AppTexts.skip.tr,
                          style: context.theme.textTheme.bodyText1
                              ?.copyWith(color: Colors.grey,fontSize: 16.sp)),
                    ),
                  )
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.board.length,
                          controller: controller.onboardController,
                          onPageChanged: (index) {
                            controller.onPageChanged(index);
                          },
                          itemBuilder: (context, index) =>
                              OnBoardingItem(controller.board[index], controller: controller.onboardController,count: controller.board.length,)),
                    ),
      Padding(
        padding:  EdgeInsets.only(bottom: 50.h),
        child: controller.isLast != true
            ? FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8.r)
          ),
backgroundColor:AppColors.primaryColor ,
          // height: 56.h,
          // minWidth: 56.w,
          onPressed: (){
            if(controller.isLast!=true){
              controller.onboardController.nextPage( duration:const Duration(
                  milliseconds: 750
              ), curve:Curves.linearToEaseOut );

            }
            //submit();

          },
         // color: AppColors.primaryColor,
          child: const Icon(Icons.arrow_forward_ios,color:Colors.white,),
       )
            : Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20.0.w),
            child:SizedBox(
              width: 200.w,
              child: DefaultButton(
                text: AppTexts.getStarted.tr,
                width: 200.w,
                onPress: (){
                  controller.getPosition().then((value) =>  Get.offAllNamed( Routes.loginRoute));

                },


              ),
            )

          /*DefaultButton(text: AppTexts.get_started.tr,
                                  screen: RoutesClass.getLoginRoute()),*/
        ),)
                  ],
                ),
              ),
            )));
  }
}
