import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';

class GoogleSignInUseCase{
  final AuthRepository authRepository;
  GoogleSignInUseCase({required this.authRepository});
  Future<UserCredential> call()async{
    return await authRepository.signInWithGoogle();
  }
}