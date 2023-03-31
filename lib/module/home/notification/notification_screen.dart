import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _headerScreen(),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildItemList(),
              separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.dividerColor2,
                  ),
              itemCount: 10),
        ),
      ],
    );
  }

  Padding buildItemList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CircleAvatar(
            backgroundImage: AssetImage(AppImage.personImage),
            radius: 20,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  AppTexts.p2,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppTexts.poppinsRegular,
                      color: AppColors.grey),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '1m',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTexts.poppinsRegular,
                      color: AppColors.grey),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _headerScreen() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100.h,
          decoration: const BoxDecoration(
              color: AppColors.headerColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: (const Icon(Icons.arrow_back))),
                //,
                const Expanded(
                  child: Text(
                    AppTexts.notificationTxt,
                    style: TextStyle(
                        fontFamily: AppTexts.poppinsSemiBold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
