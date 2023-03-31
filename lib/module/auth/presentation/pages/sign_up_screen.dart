import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/validations/form_validation.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';
import 'package:sparky/module/auth/presentation/pages/otp_code_screen.dart';

class SignUpScreen extends GetView<AuthController> {
  SignUpScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.space16.h.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultSpacer(
                height: AppSizes.space24.h,
              ),
              RichText(
                  text: TextSpan(
                      text: AppTexts.signUpTo.tr,
                      style: ThemeApp.getTextTheme()
                          .displayLarge
                          ?.copyWith(color: AppColors.textPrimaryColor),
                      children: [
                    TextSpan(
                      text: ' ' + AppTexts.appName.tr,
                      style: ThemeApp.getTextTheme()
                          .displayLarge
                          ?.copyWith(color: AppColors.primaryColor),
                    )
                  ])),
              DefaultSpacer(
                height: AppSizes.space24.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<AuthController>(
                    builder: (controller) => Column(
                      children: [
                        Container(
                          height: 490.h,
                          width: double.infinity.w,
                          child: Expanded(
                            child: PageView(
                              onPageChanged: (index) {
                                controller.onPageChanged(index);
                              },
                              controller: controller.pageController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppTexts.firstName.tr,
                                                    style:
                                                        ThemeApp.getTextTheme()
                                                            .bodyLarge
                                                            ?.copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .black1)),
                                                DefaultSpacer(
                                                  height: AppSizes.space8.h,
                                                ),
                                                DefaultTextForm(
                                                  textEditingController:
                                                      controller
                                                          .fNameController,
                                                  textInputType:
                                                      TextInputType.text,
                                                  label: 'Ex. Joe',
                                                  validator: FormValidator.validateName,
                                                ),
                                              ],
                                            ),
                                          ),
                                          DefaultSpacer(
                                            width: AppSizes.space8.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppTexts.lastName.tr,
                                                    style:
                                                        ThemeApp.getTextTheme()
                                                            .bodyLarge
                                                            ?.copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .black1)),
                                                DefaultSpacer(
                                                  height: AppSizes.space8.h,
                                                ),
                                                DefaultTextForm(
                                                  textEditingController:
                                                      controller
                                                          .lNameController,
                                                  textInputType:
                                                      TextInputType.text,
                                                  label: 'Ex. Doe',
                                                  validator:FormValidator.validateName,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space16.h,
                                    ),
                                    Text(AppTexts.phoneNumber.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    IntlPhoneField(
                                      validator: (phoneNumber) {
                                        if (phoneNumber!.number.isEmpty) {
                                          return 'Phone Number is too short';
                                        }
                                        return null;
                                      },
                                      controller: controller.phoneController,
                                      decoration: InputDecoration(
                                        labelText: '0000 000 0000',
                                        labelStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA5A5A5),
                                        ),
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA5A5A5),
                                        ),
                                        filled: false,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: AppColors.borderColor,
                                                width: 1.5)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: AppColors.borderColor,
                                                width: 1.5)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius10.r),
                                          borderSide: BorderSide(
                                            color: AppColors.borderColor,
                                            width: 1.5.w,
                                          ),
                                        ),
                                      ),
                                      dropdownIconPosition:
                                          IconPosition.trailing,
                                      disableLengthCheck: true,
                                      dropdownTextStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffA5A5A5),
                                      ),
                                      style: context.theme.textTheme.headline4,
                                      flagsButtonPadding: EdgeInsets.symmetric(
                                          horizontal: AppSizes.padding20.w),
                                      onChanged: (phone) {
                                        print(phone.completeNumber);
                                      },
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space16.h,
                                    ),
                                    Text(AppTexts.email.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    DefaultTextForm(
                                      textEditingController:
                                          controller.emailController,
                                      textInputType: TextInputType.emailAddress,
                                      label: 'Ex. Joe@Sparky.com',
                                      validator: FormValidator.validateEmail,
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space16.h,
                                    ),
                                    Text(AppTexts.password.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    DefaultTextForm(
                                      textEditingController:
                                          controller.passController,
                                      textInputType: TextInputType.text,
                                      isPassword: true,
                                      label: '**********',
                                      hasPrefixIcon: true,
                                      iconDataSuffixx: Icons.visibility,
                                      validator: FormValidator.validatePassword,
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space24.h,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppTexts.bio.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    DefaultTextForm(
                                      textEditingController:
                                          controller.bioController,
                                      textInputType: TextInputType.text,
                                      lines: 4,
                                      label: 'Placeholder',
                                      validator: (v) {},
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space16.h,
                                    ),
                                    Text(AppTexts.selectServ.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Select',
                                        border: InputBorder.none,
                                        filled: false,
                                        contentPadding:
                                            EdgeInsets.all(AppSizes.space16.w),
                                        alignLabelWithHint: false,
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE0E7FD),
                                                width: 1.5)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE0E7FD),
                                                width: 1.5)),
                                        suffixIcon: DropdownButtonFormField(
                                            value: controller.dropdownValue,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: false,
                                              alignLabelWithHint: false,
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppSizes
                                                                  .radius8.r),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xffE0E7FD),
                                                              width: 1.5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSizes.radius8.r),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xffE0E7FD),
                                                      width: 1.5)),
                                            ),
                                            items: <String>[
                                              'One',
                                              'Two',
                                              'Three',
                                              'Four'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            isExpanded: true,
                                            iconSize: 30,
                                            iconDisabledColor:
                                                AppColors.primaryColor,
                                            iconEnabledColor:
                                                AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            onChanged: (String? value) {
                                              controller
                                                  .changeSelectItem(value!);
                                            }),
                                      ),
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space16.h,
                                    ),
                                    Text(AppTexts.lang.tr,
                                        style: ThemeApp.getTextTheme()
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black1)),
                                    DefaultSpacer(
                                      height: AppSizes.space8.h,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Select',
                                        border: InputBorder.none,
                                        filled: false,
                                        contentPadding:
                                            EdgeInsets.all(AppSizes.space16.w),
                                        alignLabelWithHint: false,
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE0E7FD),
                                                width: 1.5)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE0E7FD),
                                                width: 1.5)),
                                        suffixIcon: DropdownButtonFormField(
                                            value: controller.dropdownLangValue,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: false,
                                              //  contentPadding: EdgeInsets.all(AppSizes.space8.w),
                                              alignLabelWithHint: false,
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppSizes
                                                                  .radius8.r),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xffE0E7FD),
                                                              width: 1.5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSizes.radius8.r),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xffE0E7FD),
                                                      width: 1.5)),
                                            ),
                                            items: <String>['Arabic', 'English']
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            isExpanded: true,
                                            iconSize: 30,
                                            iconDisabledColor:
                                                AppColors.primaryColor,
                                            iconEnabledColor:
                                                AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.radius8.r),
                                            onChanged: (String? value) {
                                              controller
                                                  .changeSelectLangItem(value!);
                                            }),
                                      ),
                                    ),
                                    DefaultSpacer(
                                      height: AppSizes.space24.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        !controller.isLast
                            ? DefaultButton(
                                text: AppTexts.next.tr,
                                onPress: () {
                                  if(formKey.currentState!.validate()) {
                                    if(controller.isLast!=true){
    controller.pageController.nextPage( duration:const Duration(
    milliseconds: 750
    ), curve:Curves.linearToEaseOut );
// controller.pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceInOut);
                                }
                                  }}
                              )
                            : DefaultButton(
                                text: AppTexts.register.tr,
                                onPress: () {
                                  if(formKey.currentState!.validate()){
                                    Get.to(OtpCodeScreen(phoneNumber: controller.phoneController.text));
                                  }

                                  // controller.signUpPhonVerification(
                                  //     controller.phoneController.text,
                                  //     controller.fNameController.text,
                                  //     controller.lNameController.text,
                                  //     controller.emailController.text,
                                  //     controller.passController.text,
                                  //     controller.bioController.text,
                                  //     controller.dropdownValue,
                                  //     controller.dropdownLangValue);
                                },
                              ),
                        DefaultSpacer(
                          height: AppSizes.space24.h,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller.pageController,
                            count: 2,
                            effect: WormEffect(
                                dotWidth: 24.w,
                                dotHeight: 3.h,
                                activeDotColor: AppColors.primaryColor,
                                dotColor: AppColors.borderColor),
                          ),
                        ),
                        DefaultSpacer(
                          height: AppSizes.space24.h,
                        ),
                        Center(
                          child: Text(
                            AppTexts.signUpWith.tr,
                            style: ThemeApp.getTextTheme().bodyLarge?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black1),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DefaultSpacer(
                          height: AppSizes.space24.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await controller.signInWithGoogle();
                                },
                                icon: Image.asset(
                                  AppImages.googleIcon,
                                  width: 25.w,
                                  height: 25.h,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  await controller.signInWithFacebook();
                                },
                                icon: Image.asset(
                                  AppImages.facebookIcon,
                                  width: 45.w,
                                  height: 45.h,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Image.asset(
                                  AppImages.appleIcon,
                                  width: 45.w,
                                  height: 45.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DefaultSpacer(
                          height: AppSizes.space40.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.loginRoute);
                          },
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                                    text: AppTexts.alreadyHaveAccount.tr,
                                    style: ThemeApp.getTextTheme()
                                        .bodyLarge
                                        ?.copyWith(color: AppColors.grey1),
                                    children: [
                                  TextSpan(
                                    text: ' ' + AppTexts.login.tr,
                                    style: ThemeApp.getTextTheme()
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.primaryColor),
                                  )
                                ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
