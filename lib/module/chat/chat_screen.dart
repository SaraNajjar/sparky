import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/widgets/textformfeild.dart';
import 'package:sparky/module/chat/chat_details/chat_details_screen.dart';

import '../../core/helper/app_color.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _headerScreen(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildListItem(),
              itemCount: 5,
            ),
          )
        ],
      )),
    );
  }

  Padding buildListItem() {
    return Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 12,
            left: 12
          ),
          child: InkWell(
            onTap: (){
              Get.to(()=>const ChatDetailsScreen());
            },
            child: Container(
              height: 76.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.dividerColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AppImage.personImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          AppTexts.sophiaPatel,
                          style: TextStyle(
                              fontSize: 16, fontFamily: AppTexts.poppinsSemiBold),
                        ),
                        SizedBox(height: 10.h,),
                         Text(
                          'Hello Mohammed!',
                          style: buildTextStyle(),
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            '12:08 PM',
                        style: buildTextStyle(),
                        ),
                        SizedBox(height: 10.h,),
                        const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 4,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
                        fontSize: 12, fontFamily: AppTexts.poppinsRegular,color: AppColors.grey);
  }

  Column _headerScreen() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          decoration: const BoxDecoration(
              color: AppColors.headerColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              //horizontal: 12
            ),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Text(
                      AppTexts.messages,
                      style: TextStyle(
                          fontSize: 18, fontFamily: AppTexts.poppinsSemiBold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textFormField(
                    textEditingController: TextEditingController(),
                    //_controller.searchController,
                    hintText: 'Search',
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.search),
                    validator: (value) {},
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
