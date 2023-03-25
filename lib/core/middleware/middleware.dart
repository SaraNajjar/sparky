// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AppMiddleware extends GetMiddleware{
//   RouteSettings redirect(String? route){
//     if(SharedPrefs.getDta(key:'onBoarding')!=null){
//       if(SharedPrefs.getString('token')!=null){
//         return RouteSettings(name: RoutesClass.getLayoutRoute());
//       }else{
//         return RouteSettings(name: RoutesClass.getLoginRoute());
//       }
//     }
//     return RouteSettings(name: RoutesClass.getOnboardingRoute());
//   }
// }