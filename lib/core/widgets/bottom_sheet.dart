import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';

Widget showBottomSheetCustom(context) {
   return Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
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
                    ),
                _headerbtSheet(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.dividerColor,
                ),
                    SizedBox(
                      height: 10.h,
                    ),
                _reviewTxt(),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _buildListItem(),
                    separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10.h,),
                    itemCount: 4,
                  ),
                )
              ])));
}

Container _buildListItem() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.dividerColor2)),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.cyan,
                radius: 18,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    AppTexts.karim,
                    style: TextStyle(
                        fontFamily: AppTexts.poppinsSemiBold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    glowColor: Colors.white,

                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: AppColors.starColor,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              const Spacer(),
              Text(
                AppTexts.dateTxt,
                style: _textStyle(),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            color: AppColors.dividerColor2,
            width: double.infinity,
            height: 1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppTexts.commentTxt,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _textStyle(),
          )
        ],
      ),
    ),
  );
}

TextStyle _textStyle() {
  return const TextStyle(
      color: AppColors.grey, fontFamily: AppTexts.poppinsRegular, fontSize: 12);
}

Text _reviewTxt() {
  return const Text.rich(
      TextSpan(

    text: AppTexts.reviews,
    style: TextStyle(fontSize: 16.0, fontFamily: AppTexts.poppinsSemiBold),
    children: <TextSpan>[
      TextSpan(
        text: '(21)',
        style: TextStyle(
          fontSize: 14,
          fontFamily: AppTexts.poppinsRegular,
          color: AppColors.grey,
        ),
      ),
    ],
  ),);
}

Row _headerbtSheet() {
  return Row(
    children: [
      const CircleAvatar(
        backgroundColor: Colors.cyan,
        radius: 18,
      ),
      SizedBox(
        width: 10.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppTexts.sophiaPatel,
            style: TextStyle(
                fontFamily: AppTexts.poppinsSemiBold,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.star,
                color: AppColors.starColor,
                size: 16,
              ),
              Text(
                '4.2 (21)',
                style: TextStyle(
                    fontFamily: AppTexts.poppinsRegular, fontSize: 12),
              )
            ],
          )
        ],
      ),
      const Spacer(),
      _buildIconButton(
        onPressed: () {},
        icon: AppImage.callIcon,
      ),
      _buildIconButton(
        onPressed: () {},
        icon: AppImage.messageIcon,
      ),
    ],
  );
}

IconButton _buildIconButton(
    {required void Function() onPressed, required String icon}) {
  return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: AppColors.headerColor,
        child: SvgPicture.asset(icon),
      ));
}
