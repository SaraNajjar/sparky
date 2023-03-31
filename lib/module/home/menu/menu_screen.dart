import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/home/menu/module/about_us.dart';
import 'package:sparky/module/home/menu/module/help.dart';
import 'package:sparky/module/home/menu/module/privacy.dart';
import 'package:sparky/module/home/menu/module/term.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.headerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
               CircleAvatar(
                backgroundImage: AssetImage(AppImage.personImage),
                radius: 30,
              ),
              SizedBox(height: 10.h,),
              const Text(
                  AppTexts.sophiaPatel,
              style: TextStyle(
                fontFamily: AppTexts.poppinsSemiBold,
                fontSize: 18
              ),
              ),
              SizedBox(height: 5.h,),
              const Text(
                  AppTexts.accountInfo,
              style: TextStyle(
                fontFamily: AppTexts.poppinsRegular,
                fontSize: 14,
                color: AppColors.grey2
              ),
              ),
              SizedBox(height: 10.h,),
              buildItem(
                text: AppTexts.inviteFriend,
                icon: AppImage.userAddIcon,
                onTap: () {

                },
              ),buildItem(
                text: AppTexts.messages,
                icon: AppImage.messageMIcon,
                onTap: () {

              },
              ),buildItem(
                text: AppTexts.help,
                icon: AppImage.supportIcon,
                onTap: (){
                    Get.to(const HelpScreen());
                }
              ),buildItem(
                text: AppTexts.about,
                icon: AppImage.infoIcon,
                onTap: (){
                        Get.to(const AboutUsScreen());
                }
              ),buildItem(
                text: AppTexts.privacy,
                icon: AppImage.warnIcon,
                onTap: (){
                    Get.to(const PrivacyScreen());
                }
              ),buildItem(
                text: AppTexts.term,
                icon: AppImage.securityIcon,
                onTap: (){
                  Get.to(const TermScreen());
                }
              ),buildItem(
                text: AppTexts.setting,
                icon: AppImage.settingIcon,
                onTap: (){

                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem({required String text,required String icon,required void Function() onTap }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10
        ),
        child: Container(
                height: 56.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.borderMenuColor
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SvgPicture.asset(icon),
                    SizedBox(width: 10.w,),
                      Text(
                         text,
                       style: const TextStyle(
                         fontFamily: AppTexts.poppinsRegular,
                         fontSize: 16,
                       ),
                     )
                  ],
                ),
              ),
      ),
    );
  }
}
