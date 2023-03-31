import 'package:flutter/material.dart';
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

class ForgetPassScreen extends GetView<AuthController> {
  const ForgetPassScreen({Key? key}) : super(key: key);

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
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppTexts.forgetPass.tr,
                  style: ThemeApp.getTextTheme()
                      .displayLarge
                      ?.copyWith(color: AppColors.textPrimaryColor),),
                DefaultSpacer(height: AppSizes.space8.h,),
                Text(AppTexts.dontWorry.tr,
                  style: ThemeApp.getTextTheme()
                      .headlineSmall
                      ?.copyWith(color: AppColors.grey1),),
                DefaultSpacer(
                  height: AppSizes.space32.h,
                ),
                Text(AppTexts.phoneNumber.tr,
                    style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                        fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.black1
                    )),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                IntlPhoneField(
                  validator: (phoneNumber) {
                    if (phoneNumber!.number.isEmpty) {
                      return 'Phone Number is too short';
                    }
                  },controller: controller.phoneController,
                  decoration: InputDecoration(
                    labelText: AppTexts.phoneNumber.tr,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA5A5A5),
                    ),
                    hintStyle:  const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA5A5A5),
                    ),
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                        borderSide: const BorderSide(color: AppColors.borderColor,width: 1.5)) ,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                        borderSide: const BorderSide(color: AppColors.borderColor,width: 1.5)) ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radius10.r),
                      borderSide: BorderSide(
                        color: AppColors.borderColor,
                        width: 1.5.w,
                      ),
                    ),
                  ),
                  dropdownIconPosition: IconPosition.trailing,disableLengthCheck: true,
                  dropdownTextStyle:  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffA5A5A5),
                  ),
                  style: context.theme.textTheme.headline4,
                  flagsButtonPadding:
                  EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                DefaultSpacer(
                  height: AppSizes.space16.h,
                ),
                DefaultButton(text: AppTexts.submit.tr,
                onPress: (){
                  Get.toNamed(Routes.otpRoute);
                },
                ),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.createPassRoute);
                  },
                  child: Center(
                    child: Text( AppTexts.createPass.tr+'?',
                      style: ThemeApp.getTextTheme()
                          .bodyLarge
                          ?.copyWith(color: AppColors.grey1),),
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
