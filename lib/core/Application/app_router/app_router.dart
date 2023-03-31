
import 'package:get/get.dart';
import 'package:sparky/module/chat/chat_screen.dart';
import 'package:sparky/module/home/jobs/request_s/select_request_screen.dart';
import 'package:sparky/module/home/layout/layout_screen.dart';

class Routes {
  static const String homeRoute = '/';
  static const String loginRoute = '/loginRoute';
   static const String layoutRoute = '/layout';
   static const String requestRoute = '/request';
   static const String chatRoute = '/chat';
}

List<GetPage<dynamic>> appRoutes = [
  // GetPage(
  //     name: Routes.loginRoute,
  //     page: () =>  SignInScreen(),
  // ),

  GetPage(
    name: Routes.layoutRoute,
    page: () =>   LayoutScreen(),
  ),
  GetPage(
    name: Routes.requestRoute,
    page: () =>   SelectRequestScreen(),
  ),
  GetPage(
    name: Routes.chatRoute,
    page: () =>   const ChatScreen(),
  ),

];