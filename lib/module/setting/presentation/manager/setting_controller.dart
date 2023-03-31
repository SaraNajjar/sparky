import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparky/core/services/shared_pref.dart';
enum Language { System, Arabic, English }

class SettingController extends GetxController{
  var status = false.obs;
  var notificationsStatus = false.obs;
  var langStatus = false.obs;

void changeSwitchValue(val){
  status.value=val;
  update();
}
void changeNotificationsSwitchValue(val){
  notificationsStatus.value=val;
  update();
}
void changeLangSwitchValue(val){
  langStatus.value=val;

  update();
}
  Language language = Language.English;
  Locale? initialLang = SharedPrefs.getString('lang') == null
      ? Get.deviceLocale
      : Locale(SharedPrefs.getString('lang')!);

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    SharedPrefs.setString('lang', langCode);
    Get.updateLocale(locale);
  }
}