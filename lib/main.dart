import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sparky/services/theme_services.dart';
import 'package:sparky/theme.dart';

import 'Application/app_binding/app_binding.dart';
import 'Application/app_router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:ThemeServices().theme!,
            theme:ThemeApp.light(),
            darkTheme: ThemeApp.dark(),
            initialBinding: Binding(),
            getPages: appRoutes,

          );
        });
  }
}

