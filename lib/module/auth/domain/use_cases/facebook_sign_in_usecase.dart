import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';

class FacebookSignInUseCase{
  AuthRepository authRepository;
  FacebookSignInUseCase({required this.authRepository});
  Future<UserCredential> call()async{
    return await authRepository.signInWithFacebook();
  }
}