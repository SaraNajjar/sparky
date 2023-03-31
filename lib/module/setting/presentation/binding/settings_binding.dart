import 'package:get/get.dart';
import 'package:sparky/module/setting/presentation/manager/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
          Get.lazyPut<SettingController>(() =>SettingController() );
                       }

}