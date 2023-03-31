import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sparky/core/local/local.dart';
import 'package:sparky/core/services/shared_pref.dart';
import 'package:sparky/core/services/theme_services.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/firebase_options.dart';
import 'package:sparky/module/auth/presentation/binding/auth_binding.dart';
import 'package:sparky/module/auth/presentation/pages/sign_in_screen.dart';
import 'package:sparky/module/setting/presentation/manager/setting_controller.dart';
import 'package:sparky/module/setting/presentation/pages/setting_screen.dart';
import 'package:sparky/module/splash/splash_screen.dart';
import 'package:sparky/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/Application/app_binding/app_binding.dart';
import 'core/Application/app_router/app_router.dart';
import 'module/auth/presentation/manager/auth_controller.dart';
import 'module/auth/presentation/pages/otp_code_screen.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();

  await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform
  );


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
SettingController controller=Get.put(SettingController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:ThemeServices().theme!,

            locale:controller.initialLang ,
            translations: MyLocal(),
            theme:ThemeApp.light(),
            darkTheme: ThemeApp.dark(),
            initialBinding: AuthBinding(),
            getPages: appRoutes,
            home:  const SplashScreen(),

          );
        });
  }
}

