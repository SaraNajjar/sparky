import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';
import 'package:sparky/module/setting/presentation/manager/setting_controller.dart';

import '../../../../core/helper/app_texts.dart';

class ChangePassScreen extends GetView<SettingController> {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.formBackground,
        title:    Text(AppTexts.changePass.tr,
          style: ThemeApp.getTextTheme().bodyText1?.copyWith(
            fontSize: 16.sp,
            color: Color(0xff111928)
        ),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                DefaultSpacer(
                  height: AppSizes.space24.h,
                ),
                Text(AppTexts.currentPass.tr,
                    style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                        fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.black1
                    )),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                DefaultTextForm(
                  textEditingController: controller.passController,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  label: AppTexts.currentPass.tr,
                  hasPrefixIcon: true,
                  iconDataSuffixx: Icons.visibility,
                  validator: (v){},

                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ),
                Text(AppTexts.newPass.tr,
                    style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                        fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.black1
                    )),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                DefaultTextForm(
                  textEditingController: controller.newPassController,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  label: AppTexts.newPass.tr,
                  hasPrefixIcon: true,
                  iconDataSuffixx: Icons.visibility,
                  validator: (v){},

                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ), DefaultSpacer(
                  height: AppSizes.space16.h,
                ),
                Text(AppTexts.confirmPass.tr,
                    style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                        fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.black1
                    )),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                DefaultTextForm(
                  textEditingController: controller.confirmNewPassController,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  label: AppTexts.confirmPass.tr,
                  hasPrefixIcon: true,
                  iconDataSuffixx: Icons.visibility,
                  validator: (v){},

                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ),
                DefaultButton(text: AppTexts.saveChange.tr,
                  onPress: (){

                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
