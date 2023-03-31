import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'layout_controller.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({Key? key}) : super(key: key);
  LayoutController cont = Get.put(LayoutController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(builder: (controller)=>SafeArea(
      child: Scaffold(
            backgroundColor: Colors.white,
            body: controller.screens[controller.currantScreenIndex],
            bottomNavigationBar:
                BottomNavigationBar(
                  selectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: AppTexts.poppinsRegular,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: AppTexts.poppinsRegular,
                    color: AppColors.grey0
                  ),
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 40,
                  items: controller.bottomNavIcon,
                  onTap: (value) =>
                  controller.changeBottomNavigationBar(value, context),
                  currentIndex: controller.currantScreenIndex,
                ),
          ),
        ),
    );
  }
}