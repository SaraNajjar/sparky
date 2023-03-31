import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sparky/core/error/failures.dart';
import 'package:sparky/core/network/network_info.dart';
import 'package:sparky/module/auth/data/data_sources/firebase_data_source.dart';
import 'package:sparky/module/auth/domain/entities/user_entity.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
NetworkInfo networkInfo;
FirebaseDataSource firebaseDataSource;

  AuthRepositoryImp({required FirebaseAuth firebaseAuth,required this.networkInfo,required this.firebaseDataSource})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<LoginResult> signIn(String phoneNumber, String password, String verificationCode)async {
    throw ConnectionFailure();
    // try {
    //   // Sign in with email and password
    //   final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
    //       email: phoneNumber, password: password);
    //
    //   if (userCredential.user != null) {
    //     // User is authenticated, no verification code required
    //     return LoginResult.success;
    //   } else {
    //     // User needs to verify their phone number with a verification code
    //     final AuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: verificationCode, smsCode: verificationCode);
    //
    //     final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    //
    //     if (userCredential.user != null) {
    //       return LoginResult.success;
    //     } else {
    //       return LoginResult.failure;
    //     }
    //   }
    // } on FirebaseAuthException catch (e) {
    //   return LoginResult.failure;
    // }
  }

  @override
  Future<UserCredential> signInWithGoogle() async{
    if(await networkInfo.isConnected){
      return firebaseDataSource.signInWithGoogle();
    }
    else{
      throw ConnectionFailure();
    }

  }

  @override
  Future<UserCredential> signInWithFacebook() async{
    if(await networkInfo.isConnected){
      return firebaseDataSource.signInWithFacebook();
    }
    else{
      throw ConnectionFailure();
    }
  }




}
