import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OtpCodeScreen extends GetView<AuthController> {
String phoneNumber;
  OtpCodeScreen({Key? key,required this.phoneNumber}) : super(key: key);
var otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.enterOtp.tr,
                  style: ThemeApp.getTextTheme()
                      .displayLarge
                      ?.copyWith(color: AppColors.textPrimaryColor),
                ),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                Text(
                  AppTexts.otpSent.tr,
                  style: ThemeApp.getTextTheme()
                      .headlineSmall
                      ?.copyWith(color: AppColors.grey1),
                ),
                Text(
                  phoneNumber,
                  style: ThemeApp.getTextTheme()
                      .headlineSmall
                      ?.copyWith(color: AppColors.grey1),
                ),
                DefaultSpacer(
                  height: AppSizes.space32.h,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                  fieldWidth: 40.w,
                  onSubmit: (code){
                    otp=code;
                  },
                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ),
                GetBuilder<AuthController>(
                  builder:(controller)=> DefaultButton(
                    text: AppTexts.submit.tr,
                    onPress: () {
                     controller.codeVerification(otp);
                    },
                  ),
                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ),

                Center(
                  child: GestureDetector(
                    child: Text( ' '+AppTexts.reSentCode.tr,
                      style: ThemeApp.getTextTheme().bodySmall?.copyWith(
                          color: AppColors.primaryColor
                      ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
