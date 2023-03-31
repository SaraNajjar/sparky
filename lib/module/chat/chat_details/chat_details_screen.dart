import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/widgets/textformfeild.dart';

import '../../../core/widgets/shared_widget.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _headerScreen(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImage.cameraIcon)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImage.uploadIcon)),
                  Expanded(
                    child: textFormField(
                        fillColor: AppColors.grey6,
                        hieght: 40.h,
                        hintText: 'Write',
                        textEditingController: TextEditingController(),
                        keyboardType: TextInputType.text,),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor),
                      child: SvgPicture.asset(
                        AppImage.sendIcon,
                        fit: BoxFit.none,
                      )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Material _headerScreen(context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              Get.back();
            }, icon: const Icon(Icons.arrow_back)),
             CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppImage.personImage),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppTexts.sophiaPatel,
                  style: TextStyle(
                      fontSize: 16, fontFamily: AppTexts.poppinsSemiBold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.greenColor,
                      radius: 3,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      AppTexts.online,
                      style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 12,
                          fontFamily: AppTexts.poppinsRegular),
                    )
                  ],
                )
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImage.callIcon)),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15.0),
                          )),
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 5,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.dividerColor,
                                    ),
                                  ),
                                ),
                                _buildItem(
                                    icon: AppImage.cameraIcon,
                                    text1: AppTexts.camTxt,
                                    text2: AppTexts.camTxt2,
                                    onTap: () {
                                      defaultDialog(text1: AppTexts.camTxt,text2:AppTexts.camTxt2 );
                                    }),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppColors.dividerColor,
                                ),
                                _buildItem(
                                  icon: AppImage.docTxtIcon,
                                  text1: AppTexts.docTxt,
                                  text2: AppTexts.docTxt2,
                                  onTap: (){
                                    defaultDialog(text1: AppTexts.docTxt, text2: AppTexts.docTxt2);
                                  }
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppColors.dividerColor,
                                ),
                                _buildItem(
                                  icon: AppImage.reqTxtIcon,
                                  text1: AppTexts.reqTxt,
                                  text2: AppTexts.reqTxt2,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppColors.dividerColor,
                                ),
                                _buildItem(
                                  icon: AppImage.profileIcon,
                                  text1: AppTexts.proTxt,
                                  text2: AppTexts.proTxt2,
                                ),
                              ],
                            );
                          });
                    },
                    icon: SvgPicture.asset(AppImage.moreIcon)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> defaultDialog({required String text1,required String text2,}) {
    return Get.defaultDialog(
        title: '',
        content: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                text1,
                style: firstTextStyle(),
              ),
              SizedBox(height: 5.h,),
              Text(
                text2,
                style: secondTextStyle(),
              ),
              SizedBox(height: 10.h,),
              textFormField(
                width: double.infinity,
                textEditingController: TextEditingController(),
                keyboardType: TextInputType.text,
                // suffixIcon: Text(
                //   '\$',
                //   textAlign: TextAlign.start,
                //   style: hintTextStyle(),
                // ),
                // prefixIcon: Text(
                //   '00',
                //     textAlign: TextAlign.end,
                //   style: hintTextStyle(),
                // ),
              ),
              SizedBox(height: 15.h,),
              DefaultButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Send',
                color: AppColors.primaryColor,
                height: 40.h,
                width: 150.w,
              )
            ],
          ),
        ));
  }

  TextStyle hintTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: AppTexts.poppinsRegular,
        color: AppColors.grey);
  }

  TextStyle firstTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: AppTexts.poppinsSemiBold);
  }

  TextStyle secondTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: AppTexts.poppinsRegular,
        color: AppColors.grey5
    );
  }

  Widget _buildItem({
    required String text1,
    required String text2,
    required String icon,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.headerColor,
              radius: 25,
              child: SvgPicture.asset(icon),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: AppTexts.poppinsSemiBold,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: AppTexts.poppinsRegular,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
