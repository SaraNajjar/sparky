
import 'package:get/get.dart';
import 'package:sparky/module/auth/presentation/binding/auth_binding.dart';
import 'package:sparky/module/auth/presentation/pages/create_new_pass_screen.dart';
import 'package:sparky/module/auth/presentation/pages/forgrt_pass_screen.dart';
import 'package:sparky/module/auth/presentation/pages/otp_code_screen.dart';
import 'package:sparky/module/auth/presentation/pages/sign_in_screen.dart';
import 'package:sparky/module/auth/presentation/pages/sign_up_screen.dart';
import 'package:sparky/module/setting/presentation/binding/settings_binding.dart';
import 'package:sparky/module/setting/presentation/pages/change_pass_screen.dart';

class Routes {
   static const String homeRoute = '/';
   static const String loginRoute = '/loginRoute';
   static const String signUpRoute = '/signUpRoute';
   static const String forgetPassRoute = '/forgetPassRoute';
   static const String createPassRoute = '/createPassRoute';
   static const String changePassRoute = '/changePassRoute';
   static const String changePhoneRoute = '/changePhoneRoute';
   static const String otpRoute = '/otpRoute';
}

List<GetPage<dynamic>> appRoutes = [

  GetPage(
    name: Routes.loginRoute,
    page: () =>  SignInScreen(),
    binding: AuthBinding()
  ),
 GetPage(
    name: Routes.signUpRoute,
    page: () =>  SignUpScreen(),
    binding: AuthBinding()
  ),
  GetPage(
    name: Routes.forgetPassRoute,
    page: () =>  const ForgetPassScreen(),
    binding: AuthBinding()
  ),
  GetPage(
    name: Routes.createPassRoute,
    page: () =>  const CreateNewPassScreen(),
    binding: AuthBinding()
  ),
  GetPage(
    name: Routes.changePassRoute,
    page: () =>  const ChangePassScreen(),
    binding: SettingBinding()
  ),
  GetPage(
    name: Routes.changePhoneRoute,
    page: () =>  const ChangePassScreen(),
    binding: SettingBinding()
  ),
  // GetPage(
  //   name: Routes.otpRoute,
  //   page: () =>  OtpCodeScreen(),
  //   binding: AuthBinding()
  // ),

];