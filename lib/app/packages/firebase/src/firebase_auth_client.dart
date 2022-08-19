import 'package:b_safe/app/packages/interfaces/auth_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient implements AuthClient {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  Future<void> _signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);

  @override
  Future<void> signInWithPhoneNumber(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: _signInWithCredential,
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {},
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
