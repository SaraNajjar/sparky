import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/on_boarding/on_boarding_model.dart';

class OnBoardingController extends GetxController {
  var onboardController = PageController();

  bool isLast = false;
  List<OnBoardingModel> board = [
    OnBoardingModel(
        image: AppImages.onBoardImage1,
        title: AppTexts.onBoardTitle1.tr,
        description: AppTexts.onBoardDes1.tr),
    OnBoardingModel(
        image:AppImages.onBoardImage2,
        title: AppTexts.onBoardTitle2.tr,
        description: AppTexts.onBoardDes2.tr),
    OnBoardingModel(
        image: AppImages.onBoardImage3,
        title: AppTexts.onBoardTitle3.tr,
        description: AppTexts.onBoardDes3.tr),
  ];
  void  onPageChanged(index) {
    if (index ==board.length - 1) {
      isLast = true;
      update(

      );
      print('last');
    } else {
      isLast = false;
      update(

      );
      print('not last');
    }
  }
}