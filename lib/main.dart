import 'package:b_safe/app/routes/app_pages.dart';
import 'package:b_safe/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: 'BeSafe',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
