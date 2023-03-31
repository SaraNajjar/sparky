import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/home/jobs/request_s/select_request_controller.dart';
import 'package:sparky/module/home/jobs/request_s/select_request_screen.dart';
import 'package:sparky/module/home/request/request_controller.dart';
import 'package:sparky/core/widgets/shared_widget.dart';

class RequestScreen extends StatelessWidget {
   RequestScreen({Key? key}) : super(key: key);
  final _controller = Get.put(RequestController());
  final _controllerSelected = Get.put(SelectRequestController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Obx(()=>Column(
          children: [
            _headerScreen(),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.light6, width: 1)),
                child: TabBar(
                    controller: _controller.tabController,
                    indicatorColor: AppColors.primaryColor,
                    indicatorWeight: 8,
                    labelPadding: const EdgeInsets.all(8),
                    automaticIndicatorColorAdjustment: false,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.grey,
                    indicator:  BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: _controller.radius.value,
                            bottomLeft: _controller.radius.value,
                            topRight: _controller.radiusSecond.value,
                            bottomRight: _controller.radiusSecond.value,
                        )),
                    tabs: [
                      Text(
                        AppTexts.current,
                        style: buildTextStyle(),
                      ),
                      Text(
                        AppTexts.past,
                        style: buildTextStyle(),
                      ),
                    ]),
              ),
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildListItem(context),
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: 10
                    ),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildListItem(context),
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: 10
                    ),
                  ],
                ))
          ],
        ),)
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
                    AppTexts.requestTxt,
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
  Widget buildListItem(context) {
    return  InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.dividerColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                headerListItem(),
                SizedBox(
                  height: 5.h,
                ),
                textListItem(),
                SizedBox(
                  height: 5.h,
                ),
                dividerListItem(),
                SizedBox(
                  height: 5.h,
                ),
                commentListItem(),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.dividerColor,
                ),
                _controller.isPast.value
                    ?
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DefaultButton(
                    colorTxt: AppColors.primaryColor,
                    isBorder: true,
                    text: 'Rate Contractor',
                    onPressed: (){

                    },
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
                    :
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        colorTxt: AppColors.primaryColor,
                        isBorder: true,
                        text: 'Chat',
                        onPressed: (){
                          Get.toNamed(Routes.chatRoute);
                        },
                        height: 40.h,
                        width: MediaQuery.of(context).size.width/2 - 40,
                      ),
                      SizedBox(width: 8.w,),
                      DefaultButton(
                        text: 'Start Order',
                        onPressed: (){

                            Get.to( SelectRequestScreen());
                        },
                        color: AppColors.primaryColor,
                        height: 40.h,
                        width: MediaQuery.of(context).size.width/2 - 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row commentListItem() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.cyan,
          radius: 18,
        ),
        SizedBox(
          width: 10.w,
        ),
        const Text(
          AppTexts.sophiaPatel,
          style: TextStyle(
            fontFamily: AppTexts.poppinsSemiBold,
            fontSize: 12,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset(
              AppImage.locationIcon,
              color: Colors.black,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text(
              AppTexts.locationTxt,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTexts.poppinsRegular,
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  Container dividerListItem() {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.light6,
    );
  }

  Text textListItem() {
    return const Text(
      AppTexts.p1,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: AppTexts.poppinsRegular,
          fontSize: 12,
          color: AppColors.grey),
    );
  }

  Row headerListItem() {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          width: 10.w,
        ),
        const Text(
          AppTexts.plumbing,
          style: TextStyle(fontFamily: AppTexts.poppinsSemiBold, fontSize: 16),
        ),
        const Spacer(),
        const Text(
          AppTexts.m12,
          style: TextStyle(fontFamily: AppTexts.poppinsRegular, fontSize: 12),
        )
      ],
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(fontSize: 14,
        fontFamily: AppTexts.poppinsRegular,
        fontWeight: FontWeight.w500);
  }
}