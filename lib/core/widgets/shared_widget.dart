import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';

class DefaultContainer extends StatelessWidget {
  Widget widget;
  DefaultContainer(this.widget, {super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          padding: EdgeInsets.all(20.h.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),),
              //color: Get.isDarkMode? AppColors.primaryTextColor:Colors.white),
          child: widget,
        ));
  }
}
class DefaultSpacer extends StatelessWidget {
  double? height ;
  DefaultSpacer({super.key,
    this.height=AppSizes.space24,
  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height?.h,

    );
  }
}


class DefaultButton extends StatelessWidget {
  String text;
  double? width = double.infinity;
  String? screen;
  double? radius ;
  double? height ;
  Color? color = AppColors.primaryColor;
  Color colorTxt;
  bool isBorder;
  double elevation;
  void Function() onPressed;
  DefaultButton({super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height=50,
    this.radius=8,
    this.screen,
    this.color,
    this.colorTxt= Colors.white,
    this.isBorder=false,
    this.elevation = 2,

  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!.r),
          side: BorderSide(
            color: isBorder?AppColors.dividerColor:Colors.transparent
          )
        ),
        elevation: elevation,
        color:  color,
        height: height?.h,
        onPressed: onPressed,
        child: Text(
          text.tr,
          style:  TextStyle(
              color: colorTxt, fontFamily: AppTexts.poppinsSemiBold, fontSize: 14),
        ),
      ),
    );
  }
}
class DefaultCard extends StatelessWidget {
  String text;
  double? width;


  double? radius ;
  double? height ;
  DefaultCard({super.key,
    required this.text,
    this.width,
    this.height=60,
    this.radius=5,


  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        color:  AppColors.primaryColor,


        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}

class DefaultTextForm extends StatelessWidget {
  TextEditingController textEditingController;
  TextInputType textInputType;
  ValueChanged<String>? onFieldSubmitted;
  ValueChanged<String>? onChanged;
  bool isPassword;
  FormFieldValidator<String> validator;
  GestureTapCallback? onTap;
  String? label;
  IconData? iconData;
  IconData? iconDataSuffixx;
  bool isenable;
  bool hasPrefixIcon;
  bool filled;
  bool readOnly;
  DefaultTextForm(
      {super.key,
        required this. textEditingController,
        required this. textInputType,
        this. onFieldSubmitted,
        this. onChanged,
        this. onTap,
        this.isPassword = false,
        required this.validator,
        this. label,
        this. iconData,
        this. iconDataSuffixx,
        this. isenable = true,
        this. hasPrefixIcon = false,
        this.filled=false,
        this.readOnly=false});
  @override
  Widget build(BuildContext context) {
    return     TextFormField(
      style: context.theme.textTheme.headline2?.copyWith(
          color:Get.isDarkMode?Colors.white: AppColors.dark1
      ),textAlign:TextAlign.start,readOnly:readOnly ,
      controller: textEditingController,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      enabled: isenable,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintText: label??'',
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffA5A5A5),
          ),
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffE0E7FD),width: 1.5)) ,
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffE0E7FD),width: 1.5)) ,
          // icon: Icon(iconData),
          filled: filled,
          fillColor: filled?AppColors.primarySwatchColor:null,

          suffixIcon:hasPrefixIcon ? Icon(iconDataSuffixx,color: AppColors.iconColor,) : null ,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffE0E7FD)))),
    );

  }
}






