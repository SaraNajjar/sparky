import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/validations/form_validation.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/domain/entities/user_entity.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';
import 'package:sparky/module/auth/presentation/pages/otp_code_screen.dart';

class SignInScreen extends GetView<AuthController> {
  SignInScreen({super.key});

  var formKey = GlobalKey<FormState>();
var phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultSpacer(
                  height: AppSizes.space40.h,
                ),
                RichText(text: TextSpan(
                  text: AppTexts.loginTo.tr, style:ThemeApp.getTextTheme().displayLarge?.copyWith(
                    color: AppColors.textPrimaryColor
                ),
                  children: [
                    TextSpan(
                      text: ' '+AppTexts.appName.tr,
                      style: ThemeApp.getTextTheme().displayLarge?.copyWith(
                        color: AppColors.primaryColor
                      ),
                    )
                  ]
                )),
                DefaultSpacer(
                  height: AppSizes.space48.h,
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
                  ),initialCountryCode: 'PS',
                  style: context.theme.textTheme.headline4,
                  flagsButtonPadding:
                      EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                  onSaved: (phone){
                    controller.phoneController.text=phone!.completeNumber;
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
                    validator: FormValidator.validatePassword,

                ),
                DefaultSpacer(
                  height: AppSizes.space8.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.forgetPassRoute);
                      },
                      child: Text(AppTexts.forgetPass.tr,
                      style: ThemeApp.getTextTheme().bodySmall,),
                    ),
                  ],
                ),
                DefaultSpacer(
                  height: AppSizes.space24.h,
                ),
                DefaultButton(text: AppTexts.login,
                onPress: (){
                  if(formKey.currentState!.validate()){
                    print(controller.phoneController.text);
                  }
           //   controller.phonVerification(controller.phoneController.text.trim());


                },),
                DefaultSpacer(
                  height: AppSizes.space24.h,
                ),
                Center(
                  child: Text(AppTexts.signWith.tr,
                    style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                      fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.black1
                    ),textAlign: TextAlign.center,),
                ),
                DefaultSpacer(
                  height: AppSizes.space24.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){
                          controller.signInWithGoogle();
                        },
                        icon: Image.asset(AppImages.googleIcon,width: 25.w,height: 25.h,),
                      ),IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: ()async{
                          await controller.signInWithFacebook();
                        },
                        icon: Image.asset(AppImages.facebookIcon,width: 45.w,height: 45.h,),
                      ),IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        icon: Image.asset(AppImages.appleIcon,width: 45.w,height: 45.h,),
                      ),
                    ],
                  ),
                ),
                DefaultSpacer(
                  height: AppSizes.space40.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.signUpRoute);
                    },
                    child: RichText(text: TextSpan(
                        text: AppTexts.createNewAccount.tr, style:ThemeApp.getTextTheme().bodyLarge?.copyWith(
                        color: AppColors.grey1
                    ),
                        children: [

                          TextSpan(
                            text: ' '+AppTexts.signUp.tr,
                            style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                                color: AppColors.primaryColor
                            ),
                          )
                        ]
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
