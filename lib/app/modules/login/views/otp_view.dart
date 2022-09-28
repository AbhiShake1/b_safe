import 'package:b_safe/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class OtpView extends GetView<LoginController> {
  const OtpView({super.key});

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Obx(
            () => Text(
              controller.pinCode.value.length > position
                  ? controller.pinCode.value[position]
                  : '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color.fromRGBO(93, 6, 138, 210),
              ),
              child: IconButton(
                  iconSize: 40,
                  onPressed: Get.back<dynamic>,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color.fromRGBO(93, 6, 138, 210),
                  )),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Enter 6 digits verification code sent to your number',
                            style: GoogleFonts.poppins(
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                fontSize: 21.5,
                                textStyle: const TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Color.fromRGBO(93, 6, 138, 150),
                                      blurRadius: 20,
                                      offset: Offset(10, 9),
                                    ),
                                    Shadow(
                                      color: Color.fromRGBO(93, 6, 138, 150),
                                      blurRadius: 20,
                                      offset: Offset(-10, 9),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
                              otpNumberWidget(4),
                              otpNumberWidget(5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        backgroundColor: const Color.fromRGBO(93, 6, 138, 160),
                      ),

                      onPressed: controller
                          .startCodeVerification, // check for otp here
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  NumericKeyboard(
                    onKeyboardTap: (text) {
                      if (controller.pinCode.value.length < 6) {
                        controller.pinCode.value += text;
                      }
                    },
                    textColor: const Color.fromRGBO(93, 6, 138, 125),
                    rightIcon: const Icon(
                      Icons.backspace,
                      color: Color.fromRGBO(93, 6, 138, 182),
                    ),
                    rightButtonFn: () => controller.pinCode.value = controller
                        .pinCode.value
                        .substring(0, controller.pinCode.value.length - 1),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
