import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/core/widgets/textformfeild.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildheaderScreen(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      labelItem(label:AppTexts.selectCategory),
                      SizedBox(
                        height: 10.h,
                      ),
                      textFormField(
                          textEditingController: TextEditingController(),
                          keyboardType: TextInputType.text,
                          hintText: AppTexts.select,
                          suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      labelItem(label: AppTexts.title),
                      SizedBox(
                        height: 10.h,
                      ),
                      textFormField(
                          textEditingController: TextEditingController(),
                          keyboardType: TextInputType.text,
                          hintText: AppTexts.placeholder,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      labelItem(label: AppTexts.uploadFile),
                      SizedBox(
                        height: 10.h,
                      ),
                      DottedBorder(
                        color: AppColors.grey0,
                        strokeWidth: 2,
                        dashPattern: const [
                          5,
                          5,
                        ],
                        child: Container(
                          height: 100.h,
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                              16.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(AppImage.uploadIcon,color: AppColors.grey0,),
                              SizedBox(height: 10.h,),
                              const Text(
                                AppTexts.exImg,
                                style: TextStyle(
                                    fontFamily: AppTexts.poppinsRegular,
                                    fontSize: 12,
                                    color: AppColors.grey0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      labelItem(label: AppTexts.message),
                      SizedBox(
                        height: 10.h,
                      ),
                      textFormField(
                          textEditingController: TextEditingController(),
                          keyboardType: TextInputType.text,
                          maxline: 4,
                          hintText: '${AppTexts.message}...',
                      ),

                      SizedBox(height: 15.h,),
                      DefaultButton(text: 'Send', onPressed: (){},color: AppColors.primaryColor,
                      height: 40.h,width: double.infinity,)
                    ],),
                ),
              ],
            ),
          )),
    );
  }

  Text labelItem({required String label}) {
    return  Text(label,style: const TextStyle(
                      fontSize: 12,
                      fontFamily: AppTexts.poppinsSemiBold,
                      fontWeight: FontWeight.w500
                    ),);
  }

  Container buildheaderScreen() {
    return Container(
      color: AppColors.headerColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Get.back();
              }, icon: const Icon(
                Icons.arrow_back
            ),),
            const Expanded(
              child: Center(
                child: Text(AppTexts.privacy,style: TextStyle(
                    fontFamily: AppTexts.poppinsSemiBold,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
