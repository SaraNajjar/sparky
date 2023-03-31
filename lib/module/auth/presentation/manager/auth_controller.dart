import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_sizes.dart';
import 'package:sparky/core/helper/app_texts.dart';
import 'package:sparky/core/services/shared_pref.dart';
import 'package:sparky/core/themes/theme.dart';
import 'package:sparky/core/widgets/shared_widget.dart';
import 'package:sparky/module/auth/data/repositories/auth_repositoryImp.dart';
import 'package:sparky/module/auth/domain/entities/user_entity.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';
import 'package:sparky/module/auth/domain/use_cases/facebook_sign_in_usecase.dart';
import 'package:sparky/module/auth/domain/use_cases/google_sign_in_usecase.dart';
import 'package:sparky/module/auth/domain/use_cases/sign_in_with_phone_usecase.dart';
import 'package:sparky/module/auth/presentation/pages/otp_code_screen.dart';


class AuthController extends GetxController {
  GoogleSignInUseCase googleSignInUseCase;
  FacebookSignInUseCase facebookSignInUseCase;

  AuthController({required this.googleSignInUseCase,required this.facebookSignInUseCase});

  static FirebaseAuth _auth = FirebaseAuth.instance;

  bool showVerificationCodeInput = false;
  String dropdownValue = 'One';
  String dropdownLangValue = 'English';
  bool isLast = false;

  var verificationId = ''.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  String verificationCode = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  PageController pageController = PageController();


  void changeSelectItem(String value) {
    dropdownValue = value;
    update();
  }
  void changeSelectLangItem(String value) {
    dropdownLangValue = value;
    update();
  }

  void onPageChanged(index) {
    if (index == 1) {
      isLast = true;
      update();
      print('last');
    } else {
      isLast = false;
      update();
      print('not last');
    }
  }

  void submit(String verification, int resendToken) {
    verificationId.value = verification;
    showVerificationCodeInput = true;
    update();
  }

  Future<void> phonVerification(String phoneNumber,) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (credential)async{
        await _auth.signInWithCredential(credential);
        },

        codeSent: (verificationId,resendToken){
        this.verificationId.value=verificationId;
        Get.to(OtpCodeScreen(phoneNumber: phoneController.text,));
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value=verificationId;

        },
    verificationFailed: (e){

          Get.snackbar('error:', e.code);

    },);
  }
  Future<void> signUpPhonVerification(
      String phoneNumber,
      String fName,
      String lName,
      String email,
      String password,
      String bio,
      String service,
      String language,
      ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (credential)async{
        await _auth.signInWithCredential(credential);
        },

        codeSent: (verificationId,resendToken){
        this.verificationId.value=verificationId;
        Get.to(OtpCodeScreen(phoneNumber: phoneController.text));
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value=verificationId;

        },
    verificationFailed: (e){

          Get.snackbar('error:', e.code);

    },

    );
    
  }
  CollectionReference usersColl = FirebaseFirestore.instance.collection('users');

  Future<bool> codeVerification(String otp)async {
    var credential=await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    usersColl.add({
      'first_name':fNameController.text,
      'last':lNameController.text,
      'email':emailController.text,
      'password':passController.text,
      'bio':bioController.text,
      'service':dropdownValue,
      'lang':dropdownLangValue,
    });
print(credential);
print(usersColl.toString());


  return  credential.user!=null? true: false;

  }

  signInWithGoogle(){
    googleSignInUseCase.call();

  }

  signInWithFacebook()async{
facebookSignInUseCase.call();
  }



}
