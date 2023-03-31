import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sparky/module/auth/domain/entities/user_entity.dart';
import 'package:sparky/module/auth/domain/repositories/auth_repository.dart';

class PhoneSignInUseCase {
  final AuthRepository repository;

  PhoneSignInUseCase({required this.repository});

  Future<LoginResult> call(String phoneNumber, String password, String verificationCode) async {
    return repository.signIn(phoneNumber, password, verificationCode);
  }
}

