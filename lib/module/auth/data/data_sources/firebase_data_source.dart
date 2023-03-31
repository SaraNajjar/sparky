import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseDataSource{
  Future<UserCredential>signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}

class FirebaseDataSourceImpl extends FirebaseDataSource{
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;
  FirebaseDataSourceImpl({required this.firebaseAuth,required this.googleSignIn,required this.facebookAuth});
  @override
  Future<UserCredential> signInWithGoogle()async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await firebaseAuth.signInWithCredential(credential);



  }

  @override
  Future<UserCredential> signInWithFacebook() async{
    try {
      final LoginResult loginResult =
      await facebookAuth.login(permissions: ['email',"public_profile"]);

      if (loginResult.status == LoginStatus.success) {
        final AccessToken? accessToken = loginResult.accessToken;

        final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken!.token);
        var result= await firebaseAuth.signInWithCredential(credential);
        print(result);
        print("logggggggin ${loginResult}");

        return result;
      } else {
        throw Exception('Failed to login with Facebook');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      print(e);
      throw Exception('An unknown error occurred');
    }
  }

}