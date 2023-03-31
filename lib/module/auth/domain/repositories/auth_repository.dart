import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sparky/module/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<LoginResult> signIn(String phoneNumber, String password, String verificationCode);
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}
