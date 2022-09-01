import 'package:b_safe/app/packages/exceptions/exceptions.dart';
import 'package:b_safe/app/packages/interfaces/auth_client.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  AuthRepo(this._auth);

  final AuthClient _auth;

  Future<Either<void, VerificationFailedException>> signInWithPhone(
    String phoneNumber, {
    void Function(String, int?)? onCodeSent,
  }) async {
    try {
      await _auth.signInWithPhoneNumber(
        phoneNumber,
        onCodeSent: onCodeSent,
      );
      return const Left(null);
    } catch (e) {
      return Right(VerificationFailedException(e));
    }
  }

  Future<Either<void, VerificationFailedException>> verifyOtpAndSignIn(
    String verificationId,
    String code,
  ) async {
    try {
      await _auth.verifyOtpAndSignIn(verificationId, code);
      return const Left(null);
    } catch (e) {
      return Right(VerificationFailedException(e));
    }
  }
}
