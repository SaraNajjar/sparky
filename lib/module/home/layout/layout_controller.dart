import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/home/jobs/jobs_screen.dart';
import 'package:sparky/module/home/menu/menu_screen.dart';
import 'package:sparky/module/home/notification/notification_screen.dart';
import 'package:sparky/module/home/request/request_screen.dart';


class LayoutController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  //bool islaod = true;

  List<Widget> screens = [
    JobsScreen(),
    const NotificationScreen(),
     RequestScreen(),
    const MenuScreen(),
  ];

  List<String> titles = [
    'Jobs',
    'Notification',
    'Request',
    'Menu'
  ];

  List<BottomNavigationBarItem> bottomNavIcon = [
    BottomNavigationBarItem(
      label: AppTexts.jobsTxt,
      icon: SvgPicture.asset(AppImage.jobAfterIcon,color: AppColors.grey0,),
      activeIcon: SvgPicture.asset(AppImage.jobIcon,)
    ),
    BottomNavigationBarItem(
      label: AppTexts.notificationTxt,
      icon: SvgPicture.asset(AppImage.notificationIcon,),
      activeIcon: SvgPicture.asset(AppImage.notificationAfterIcon)
    ),
    BottomNavigationBarItem(
      label: AppTexts.requestTxt,
      icon: SvgPicture.asset(AppImage.requestIcon,),
      activeIcon: SvgPicture.asset(AppImage.requestAfterIcon,)
    ),
    BottomNavigationBarItem(
      label: AppTexts.menuTxt,
      icon: SvgPicture.asset(AppImage.menuIcon,),
      activeIcon: SvgPicture.asset(AppImage.menuIcon,color: AppColors.primaryColor,)
    ),
  ];
  int currantScreenIndex = 0;

  void changeBottomNavigationBar(int index, context) {
    currantScreenIndex = index;
    update();
  }

}