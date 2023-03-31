import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_texts.dart';

class textFormField extends StatelessWidget {

  final String? hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
   var prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  double? width ;
  bool? enabled = true;
  double? hieght = 50.h;
  int? maxline;
  Color? fillColor;


  textFormField({super.key,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.maxline,
    this.width,
    this.hieght,
    this.enabled,
    required this.textEditingController,
    required TextInputType keyboardType,
    this.fillColor=Colors.white,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght,
      width: width,
      child: TextFormField(
        enabled: enabled,
        controller: textEditingController,
        maxLines: maxline,
        decoration: InputDecoration(
          fillColor: fillColor,
          hintText: hintText,

          hintStyle: const TextStyle(
              color: AppColors.grey3,
              fontSize: 13,
              fontFamily: AppTexts.poppinsRegular,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(

            borderSide: BorderSide(color: AppColors.dividerColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.dividerColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        obscureText: obscureText!,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
