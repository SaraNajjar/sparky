import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sparky/core/local/local.dart';
import 'package:sparky/core/services/shared_pref.dart';
import 'package:sparky/core/services/theme_services.dart';
import 'package:sparky/core/themes/theme.dart';

import 'core/Application/app_binding/app_binding.dart';
import 'core/Application/app_router/app_router.dart';
import 'module/home/layout/layout_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
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
            home:  LayoutScreen(),
            //locale:controller.initialLang ,
            translations: MyLocal(),
            theme:ThemeApp.light(),
            darkTheme: ThemeApp.dark(),
            initialBinding: Binding(),
            getPages: appRoutes,
          );
        });
  }
}

