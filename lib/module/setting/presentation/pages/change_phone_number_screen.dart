import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';
import 'package:sparky/module/setting/presentation/manager/setting_controller.dart';

import '../../../../core/helper/app_texts.dart';

class ChangePhoneScreen extends GetView<SettingController> {
  const ChangePhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.formBackground,
        title:    Text(AppTexts.changePhone.tr,
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
                Text(AppTexts.password.tr,
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
                  label: AppTexts.password.tr,
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
