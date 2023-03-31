import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildheaderScreen(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(AppImage.sparkyIcon),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 20
                  ),
                  child: Text(AppTexts.po,style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTexts.poppinsRegular
                  ),),
                ),
              ],),
          )),
    );
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
                child: Text(AppTexts.term,style: TextStyle(
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
