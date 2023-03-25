import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/module/on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5), (){

      Get.offAll(() =>  OnBoarding_Screen());
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset(AppImages.appLogo),),
    );
  }
}