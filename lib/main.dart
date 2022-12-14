import 'package:b_safe/app/config/theme.dart';
import 'package:b_safe/app/routes/app_pages.dart';
import 'package:b_safe/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void _subscribeAuthChanges() => FirebaseAuth.instance.authStateChanges().listen(
      (user) => Get.offAllNamed<dynamic>(
        user == null ? Routes.LOGIN : Routes.HOME,
      ),
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );

  runApp(
    GetMaterialApp(
      onInit: _subscribeAuthChanges,
      title: 'BeSafe',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    ),
  );
}
