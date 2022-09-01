import 'package:b_safe/app/modules/login/repo/auth_repo.dart';
import 'package:b_safe/app/modules/login/views/otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _auth = Get.find<AuthRepo>();

  late final TextEditingController phoneNumberController, smsCodeController;

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    smsCodeController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    smsCodeController.dispose();
    super.onClose();
  }

  Future<void> signInWithPhone() async {
    final result = await _auth.signInWithPhone(
      phoneNumberController.text,
      // ignore: avoid_redundant_argument_values
      onCodeSent: (verificationId, __) => Get.snackbar(
        'Code sent',
        'OTP has been messaged to your number',
      ),
    );
    result.fold(
      (l) => Get.to<dynamic>(const OtpView()),
      (e) => Get.snackbar('Something went wrong', e.toString()),
    );
  }
}
