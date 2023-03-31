
import 'package:get/get.dart';
import 'package:sparky/module/home/jobs/request_s/select_request_controller.dart';
import 'package:sparky/module/home/layout/layout_controller.dart';
import 'package:sparky/module/home/request/request_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
     Get.lazyPut(() => LayoutController(), fenix: true);
     Get.lazyPut(() => RequestController(), fenix: true);
     Get.lazyPut(() => SelectRequestController(), fenix: false);

  }
}