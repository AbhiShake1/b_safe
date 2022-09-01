import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OtpView extends GetView {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OtpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
