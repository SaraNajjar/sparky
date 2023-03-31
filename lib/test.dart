/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Define the login use case interface
abstract class LoginUseCase {
  Future<LoginResult> execute(String phoneNumber, String password, String verificationCode);
}

// Define the login result model
enum LoginResult { success, failure }

// Implement the login use case with Firebase Authentication
class FirebaseLoginUseCase implements LoginUseCase {
  final FirebaseAuth _auth;

  FirebaseLoginUseCase(this._auth);

  @override
  Future<LoginResult> execute(String phoneNumber, String password, String verificationCode) async {
    try {
      // Sign in with email and password
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: phoneNumber, password: password);

      if (userCredential.user != null) {
        // User is authenticated, no verification code required
        return LoginResult.success;
      } else {
        // User needs to verify their phone number with a verification code
        final AuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: verificationCode);

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          return LoginResult.success;
        } else {
          return LoginResult.failure;
        }
      }
    } on FirebaseAuthException catch (e) {
      return LoginResult.failure;
    }
  }
}

// Create the login screen widget
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LoginUseCase _loginUseCase = FirebaseLoginUseCase(FirebaseAuth.instance);
  final _formKey = GlobalKey<FormState>();

  String _phoneNumber = '';
  String _password = '';
  String _verificationCode = '';

  bool _showVerificationCodeInput = false;
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  hintText: 'Enter your phone number',
                ),
                validator: (String? value) {
                  if (value?.length==0) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value?.length==0) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              Visibility(
                visible: _showVerificationCodeInput,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Verification code',
                    hintText: 'Enter the code sent to your phone',
                  ),
                  validator: (value) {
                    if (value?.length==0) {
                      return 'Please enter the verification code';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _verificationCode
                      = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_showVerificationCodeInput) {
// Verify the verification code entered by the user
                        final result = await _loginUseCase.execute(
                            _phoneNumber, _password, _verificationCode);
                        print(result);
                        if (result == LoginResult.success) {
                          // Login successful, navigate to home screen
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid verification code'),
                            ),
                          );
                        }
                      } else {
                        // Send the verification code to the user's phone
                        await _auth.verifyPhoneNumber(
                          phoneNumber: _phoneNumber,
                          verificationCompleted: (phoneAuthCredential) {},
                          verificationFailed: (verificationFailed) {},
                          codeSent: (verificationId, resendToken) {
                            setState(() {
                              _verificationId = verificationId;
                              _showVerificationCodeInput = true;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                        );
                      }
                    }
                  },
                  child: Text(_showVerificationCodeInput ? 'Verify' : 'Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  late String _verificationId;

  Future<void> _verifyPhone() async {
    final phone =  _phoneController.text.trim();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // TODO: Navigate to next screen after authentication is complete
      },
      verificationFailed: (FirebaseAuthException e) {
        // TODO: Handle verification failure
        print(e);
      },
      codeSent: ( verificationId,  resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> _verifyCode() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _codeController.text.trim(),
    );

    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.signInWithCredential(credential);
    // TODO: Navigate to next screen after authentication is complete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Enter phone number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Verify Phone'),
              onPressed: _verifyPhone,
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                hintText: 'Enter verification code',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Verify Code'),
              onPressed: _verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
