import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sparky/core/network/network_info.dart';
import 'package:sparky/module/auth/data/data_sources/firebase_data_source.dart';
import 'package:sparky/module/auth/data/repositories/auth_repositoryImp.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';
import 'package:sparky/module/auth/domain/use_cases/facebook_sign_in_usecase.dart';
import 'package:sparky/module/auth/domain/use_cases/google_sign_in_usecase.dart';
import 'package:sparky/module/auth/domain/use_cases/sign_in_with_phone_usecase.dart';
import 'package:sparky/module/auth/presentation/manager/auth_controller.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GoogleSignInUseCase>(() => GoogleSignInUseCase(authRepository: Get.find()));
    Get.lazyPut<FacebookSignInUseCase>(() => FacebookSignInUseCase(authRepository: Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImp(firebaseAuth: Get.find(), networkInfo: Get.find(), firebaseDataSource: Get.find()));
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<GoogleSignIn>(() => GoogleSignIn());
    Get.lazyPut<FacebookAuth>(() => FacebookAuth.instance);
    Get.lazyPut<FirebaseDataSource>(() => FirebaseDataSourceImpl(firebaseAuth: Get.find(), googleSignIn: Get.find(), facebookAuth: Get.find()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());
    Get.put<AuthController>(AuthController(googleSignInUseCase: Get.find(), facebookSignInUseCase: Get.find()));

  }

}