import 'package:get/get.dart';
import 'package:sparky/module/auth/auth_controller.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}