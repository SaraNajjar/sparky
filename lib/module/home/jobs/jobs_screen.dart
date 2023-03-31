import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/home/jobs/jobs_controller.dart';
import 'package:sparky/core/widgets/textformfeild.dart';

class JobsScreen extends StatelessWidget {
  JobsScreen({Key? key}) : super(key: key);
  final _controller = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child:Obx(()=> Column(
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
                    //padding: EdgeInsets.all(20),
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
                        AppTexts.allJobs,
                        style: buildTextStyle(),
                      ),
                      Text(
                        AppTexts.bestMatches,
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
                    itemBuilder: (context, index) => buildListItem(),
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: 10),
                const Text(''),
              ],
            ))
          ],
        )),
      ),
    );
  }

  Column _headerScreen() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.headerColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi Sophia 👋',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppTexts.poppinsSemiBold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text(
                          AppTexts.searchForJobs,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppTexts.poppinsRegular,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                     CircleAvatar(
                      backgroundImage: AssetImage(AppImage.personImage),
                      radius: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                textFormField(
                  textEditingController: _controller.searchController,
                  hintText: 'Search',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.search),
                  validator: (value) {},
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListItem() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.requestRoute);
      },
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
         CircleAvatar(
          backgroundImage: AssetImage(AppImage.personImage),
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
              color: AppColors.babyBlue,
              borderRadius: BorderRadius.circular(8),),
          child: SvgPicture.asset(AppImage.plumIcon,fit: BoxFit.none,),
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
    return const TextStyle(fontSize: 15, fontFamily: AppTexts.poppinsRegular);
  }
}
