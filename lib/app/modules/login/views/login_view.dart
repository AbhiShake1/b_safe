import 'package:b_safe/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Scaffold(
          // backgroundColor: Colors.white,
          // body:
          SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 35),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                            Center(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                constraints:
                                    const BoxConstraints(maxHeight: 250),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60))),
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
                                  blurRadius: 10.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                                Shadow(
                                  color: Color.fromRGBO(93, 6, 138, 150),
                                  blurRadius: 10.0,
                                  offset: Offset(-5.0, 5.0),
                                ),
                              ],
                            ),
                            letterSpacing: 6,
                            color: Color.fromRGBO(34, 29, 58, 85)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(text: 'We will send you an '),
                              TextSpan(text: 'One Time Password '),
                              TextSpan(text: 'on this mobile number'),
                            ]),
                          )),
                      Container(
                        height: 40,
                        constraints: const BoxConstraints(maxWidth: 500),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text('Hi'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Text("Hi"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
