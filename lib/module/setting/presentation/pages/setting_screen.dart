import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/themes/app_themes.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/setting/presentation/manager/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
   SettingScreen({Key? key}) : super(key: key);
SettingController controller=Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.formBackground,
        elevation: 0,
        title: Text(AppTexts.setting.tr,
        style: ThemeApp.getTextTheme().bodyText1?.copyWith(
          fontSize: 16.sp,
          color: Color(0xff111928)
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SettingController>(
          builder:(controller)=> Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppTexts.darkMode.tr),
                    FlutterSwitch(
                        inactiveColor: Color(0xffE9E9E9),
                        activeColor: AppColors.primaryColor,
                        value: controller.status.value, onToggle:(val){
                          controller.changeSwitchValue(val);
                    }),
                  ],
                ),
                DefaultSpacer(height: AppSizes.space24.h,),
                const Divider(
                  color: Color(0xffE9E9E9),
                  thickness: 1,
                ),
                DefaultSpacer(height: AppSizes.space24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppTexts.notifications.tr),
                    FlutterSwitch(
                        inactiveColor: Color(0xffE9E9E9),
                        activeColor: AppColors.primaryColor,
                        value: controller.notificationsStatus.value, onToggle:(val){
                      controller.changeNotificationsSwitchValue(val);
                    }),
                  ],
                ),
                DefaultSpacer(height: AppSizes.space24.h,),
                const Divider(
                  color: Color(0xffE9E9E9),
                  thickness: 1,
                ),
                DefaultSpacer(height: AppSizes.space24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppTexts.lang.tr),
                    FlutterSwitch(
                      activeIcon: Text(Language.English.name,
                      style: ThemeApp.getTextTheme().headlineLarge,
                      ),

                      inactiveIcon: Text(Language.Arabic.name),
                        inactiveText: 'Arabic' ,

                        inactiveColor: Color(0xffE9E9E9),
                        activeColor: AppColors.primaryColor,
                        value: controller.langStatus.value, onToggle:(val){
                      controller.changeLangSwitchValue(val);

                      val?controller.changeLang('en'):controller.changeLang('ar');

                    }),
                  ],
                ),
                DefaultSpacer(height: AppSizes.space24.h,),
                const Divider(
                  color: Color(0xffE9E9E9),
                  thickness: 1,
                ),
              ],
            ),
          )
        ),
      ),

    );
  }
}
