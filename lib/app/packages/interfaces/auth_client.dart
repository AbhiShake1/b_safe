abstract class AuthClient {
  Future<void> signInWithPhoneNumber(
    String number, {
    void Function(String, int?)? onCodeSent,
  });

  Future<void> verifyOtpAndSignIn(String verificationId, String code);

  Future<void> signOut();
}
