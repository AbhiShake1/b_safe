import 'package:b_safe/app/packages/exceptions/exceptions.dart';
import 'package:b_safe/app/packages/interfaces/auth_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient implements AuthClient {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  @override
  Future<void> signInWithPhoneNumber(
    String number, {
    void Function(String, int?)? onCodeSent,
  }) =>
      _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: _auth.signInWithCredential,
        verificationFailed: (error) => throw VerificationFailedException(error),
        codeSent: (verificationId, forceResendingToken) {
          onCodeSent?.call(verificationId, forceResendingToken);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );

  @override
  Future<void> verifyOtpAndSignIn(String verificationId, String code) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: code,
    );
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() => _auth.signOut();
}
