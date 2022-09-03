import 'package:b_safe/app/modules/login/repo/auth_repo.dart';
import 'package:b_safe/app/modules/login/views/otp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController implements GetxService {
  final _auth = Get.find<AuthRepo>();

  late final TextEditingController phoneNumberController;
  final numberKey = GlobalKey<FormState>();

  final _toStartVerification = false.obs;

  final pinCode = ''.obs;

  String? numberValidator(String? text) =>
      text?.isPhoneNumber ?? false ? null : 'Invalid';

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }

  void startCodeVerification() => _toStartVerification.value = true;

  Future<void> signInWithPhone() async {
    if (!numberKey.currentState!.validate()) return;
    final result = await _auth.signInWithPhone(
      phoneNumberController.text,
      // ignore: avoid_redundant_argument_values
      onCodeSent: (verificationId, __) =>
          _toStartVerification.listen((start) async {
        if (start) {
          final res = await _auth.verifyOtpAndSignIn(
            verificationId,
            pinCode.value,
          );
          res.fold(
            (l) => Get.snackbar('Successful. now redirect', ''),
            (e) {
              pinCode.value = '';
              Get.snackbar('Something went wrong', e.toString());
            },
          );
        }
      }),
    );
    result.fold(
      (l) => Get.to<dynamic>(const OtpView()),
      (e) => Get.snackbar('Something went wrong', e.toString()),
    );
  }
}
