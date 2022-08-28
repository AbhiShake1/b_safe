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
          SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Expanded(
                  flex: 3,
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
                SizedBox(height: 20),
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
                                  blurRadius: 10.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                                Shadow(
                                  color: Color.fromRGBO(93, 6, 138, 150),
                                  blurRadius: 10.0,
                                  offset: Offset(-5.0, 5.0),
                                ),
                              ],
                            )),
                          ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        // height: 45,
                        // constraints: const BoxConstraints(
                        //     maxWidth: 500
                        // ),
                        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        child: const TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                ),
                                hintText: '+91',


                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(
                            maxWidth: 500
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(93, 6, 138, 160))
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(93, 6, 138, 150),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   color: Colors.purpleAccent
                        //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: <Widget>[
                        //         Text(
                        //           'Next',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //         Container(
                        //           padding: const EdgeInsets.all(8),
                        //           decoration: BoxDecoration(
                        //             borderRadius: const BorderRadius.all(Radius.circular(20)),
                        //             color: MyColors.primaryColorLight,
                        //           ),
                        //           child: Icon(
                        //             Icons.arrow_forward_ios,
                        //             color: Colors.white,
                        //             size: 16,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
