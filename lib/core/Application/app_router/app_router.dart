
import 'package:get/get.dart';
import 'package:sparky/module/auth/auth_binding.dart';
import 'package:sparky/module/auth/sign_in_screen.dart';

class Routes {
   static const String homeRoute = '/';
   static const String loginRoute = '/loginRoute';
}

List<GetPage<dynamic>> appRoutes = [

  GetPage(
    name: Routes.loginRoute,
    page: () =>  SignInScreen(),
    binding: AuthBinding()
  ),

];