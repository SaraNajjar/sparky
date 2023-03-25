import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sparky/core/services/shared_pref.dart';
enum Language { System, Arabic, English }
class AuthController extends GetxController{

  TextEditingController phoneController=TextEditingController();
  TextEditingController passController=TextEditingController();
  Language language=Language.English;
  Locale? initialLang= SharedPrefs.getString('lang')==null?Get.deviceLocale:Locale(SharedPrefs.getString('lang')!);
  void changeLang(String langCode){

    Locale locale=Locale(langCode);
    SharedPrefs.setString('lang',langCode);
    Get.updateLocale(locale);
  }
}