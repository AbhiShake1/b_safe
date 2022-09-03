import 'package:b_safe/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 35),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          textDirection: TextDirection.rtl,
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 240,
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                // margin: const EdgeInsets.only(top: 100),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(93, 6, 138, 210),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                constraints:
                                    const BoxConstraints(maxHeight: 250),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset('assets/women.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'B SAFE',
                        style: GoogleFonts.limelight(
                          fontWeight: FontWeight.w900,
                          fontSize: 50,
                          textStyle: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(93, 6, 138, 150),
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                              Shadow(
                                color: Color.fromRGBO(93, 6, 138, 150),
                                blurRadius: 10,
                                offset: Offset(-5, 5),
                              ),
                            ],
                          ),
                          letterSpacing: 6,
                          color: const Color.fromRGBO(34, 29, 58, 85),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'We will be sending you an OTP on this mobile number.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            textStyle: const TextStyle(
                              shadows: [
                                Shadow(
                                  color: Color.fromRGBO(93, 6, 138, 150),
                                  blurRadius: 10,
                                  offset: Offset(5, 5),
                                ),
                                Shadow(
                                  color: Color.fromRGBO(93, 6, 138, 150),
                                  blurRadius: 10,
                                  offset: Offset(-5, 5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 10,
                        ),
                        child: TextFormField(
                          key: controller.numberKey,
                          validator: controller.numberValidator,
                          autovalidateMode: AutovalidateMode.always,
                          controller: controller.phoneNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '+91',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: ElevatedButton(
                          onPressed: controller.signInWithPhone,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(93, 6, 138, 160),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(93, 6, 138, 150),
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
