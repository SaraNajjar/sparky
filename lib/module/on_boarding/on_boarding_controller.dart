import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/module/on_boarding_model.dart';

class OnBoardingController extends GetxController {
  var onboardController = PageController();

  bool isLast = false;
  List<OnBoardingModel> board = [
    OnBoardingModel(
        image: AppImages.onBoardImage1,
        title: 'Get Access To Quick Loans',
        description: '''Easily get access to loans 
using your phone'''),
    OnBoardingModel(
        image: AppImages.onBoardImage2,
        title: 'Easy & Convenient',
        description: 'No guarantors, No long queues, No paper.'),
    OnBoardingModel(
        image:AppImages.onBoardImage3,
        title: 'Track Everything',
        description: '''Your financial journey
start here'''),
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