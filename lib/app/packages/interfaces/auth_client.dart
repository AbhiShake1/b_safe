abstract class AuthClient {
  Future<void> signInWithPhoneNumber(
    String number, {
    void Function(String, int?)? onCodeSent,
  });

  Future<void> signOut();
}
