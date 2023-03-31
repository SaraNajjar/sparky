import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sparky/core/Application/app_router/app_router.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_images.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/module/home/jobs/request_s/select_request_controller.dart';
import 'package:sparky/core/widgets/bottom_sheet.dart';
import 'package:sparky/core/widgets/progress_linear.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
class SelectRequestScreen extends StatelessWidget {
   SelectRequestScreen({Key? key}) : super(key: key);
   final _controller = Get.put(SelectRequestController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:Obx(()=> Column(
              children: [
                _headerScreen(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.babyBlue,
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AppImage.plumIcon,fit: BoxFit.none,)  ,
                          ),
                          SizedBox(width: 5.w,),
                          const Text(
                            AppTexts.plumbing,
                            style: TextStyle(
                              fontFamily: AppTexts.poppinsSemiBold,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      const Text(
                        AppTexts.p1,
                        style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppTexts.poppinsRegular,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      commentItem(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.light6,
                ),
                _controller.isStart.value
                    ?
                progressLinear(
                    width: 10,
                    text: 'text',
                    dot1: AppColors.greenColor,
                    dot2: AppColors.greenColor,
                    dot3: AppColors.greenColor,
                    line1: AppColors.greenColor,
                    line2: AppColors.greenColor,
                    line3: AppColors.greenColor
                )
                    :
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      serviceLocationItem(),
                      SizedBox(
                        height: 10.h,
                      ),
                      _controller.isStart.value
                          ?
                      const SizedBox()
                          :
                      buildRatingPerson(context),
                      SizedBox(
                        height: 20.h,
                      ),
                      _controller.isStart.value
                          ?
                      DefaultButton(
                        onPressed: (){
                          Get.defaultDialog(
                              title: '',
                              content: _contentDialog()
                          );
                        },
                        text: 'Start Order',
                        width:double.infinity,
                        color: AppColors.primaryColor,

                      )
                          :
                      Row(
                        children: [
                          DefaultButton(
                            onPressed: (){
                              Get.toNamed(Routes.chatRoute);
                            },
                            text: 'Chat',
                            width:(width/2)- 26,
                            color: Colors.white,
                            isBorder: true,
                            colorTxt: AppColors.primaryColor,
                            elevation: 0,

                          ),
                          SizedBox(width: 10.w,),
                          DefaultButton(
                            onPressed: (){
                              Get.defaultDialog(
                                  title: '',
                                  content: _contentDialog()
                              );
                            },
                            text: 'Apply',
                            width:(width/2)- 26,
                            color: AppColors.primaryColor,

                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
          )
      ),
    );
  }

  Container serviceLocationItem() {
    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.light6
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SvgPicture.asset(AppImage.locationIcon),
                              SizedBox(width: 5.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      AppTexts.serviceLocationTxt,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTexts.poppinsRegular,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                  ),
                                  ),
                                  SizedBox(height: 2.h,),
                                  const Text(
                                      AppTexts.locationTxt,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTexts.poppinsRegular,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: (){

                                  }, icon: const Icon(Icons.arrow_forward_ios,size: 15,))
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                      )
                                    ),
                                    child: Image.asset(AppImage.mapImage)),
                                const Text(
                                    AppTexts.showMapTxt,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: AppTexts.poppinsRegular
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
  }

  Container buildRatingPerson(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.light6
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder( // <-- SEE HERE
                                    borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                ),),
                                    builder: (BuildContext context){
                                      return  showBottomSheetCustom(context);
                                    }
                                );
                              },
                              child: Row(
                                children: [
                                   CircleAvatar(
                                    backgroundColor: AppColors.babyBlue,
                                     backgroundImage: AssetImage(AppImage.personImage),
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
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Icon(Icons.star,color: AppColors.starColor,size: 16,),
                                          Text(
                                              '4.2 (21)',
                                            style: TextStyle(
                                              fontFamily: AppTexts.poppinsRegular,
                                              fontSize: 12
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: (){

                                      },
                                      icon: const Icon(Icons.arrow_forward_ios,size: 15,))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
  }

  Column _contentDialog() {
    return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImage.dialogIcon),
                                  const Text(
                                      AppTexts.successDialog,
                                  style: TextStyle(
                                    fontFamily: AppTexts.poppinsSemiBold,
                                    fontSize: 18,
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                      AppTexts.statementDialog,
                                  style: TextStyle(
                                    fontFamily: AppTexts.poppinsRegular,
                                    fontSize: 14,
                                    color: AppColors.grey
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  DefaultButton(

                                      color: AppColors.primaryColor,
                                      text: 'Done',
                                      onPressed: (){
                                        _controller.isStart.value=true;
                                        Get.back();
                                      },
                                    height: 40.h,
                                    width: 200.w,
                                  )
                                ],
                              );
  }

  Container _headerScreen() {
    return Container(
              decoration: const BoxDecoration(
                color: AppColors.headerColor
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                    icon: const Icon(Icons.arrow_back, ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          AppTexts.requestTxt,
                          style: TextStyle(
                            fontFamily: AppTexts.poppinsSemiBold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (){

                        },
                        icon: SvgPicture.asset(AppImage.moreIcon),
                    )
                  ],
                ),
              ),
            );
  }

  Row commentItem() {
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
            fontWeight: FontWeight.w500
          ),
        ),
        const Spacer(),
        const Text(
          AppTexts.m12,
          style:
          TextStyle(fontFamily: AppTexts.poppinsRegular, fontSize: 12),
        )
      ],
    );
  }
}
