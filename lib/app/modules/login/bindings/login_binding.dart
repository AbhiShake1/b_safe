import 'package:b_safe/app/modules/login/controllers/login_controller.dart';
import 'package:b_safe/app/modules/login/repo/auth_repo.dart';
import 'package:b_safe/app/packages/firebase/firebase_client.dart';
import 'package:b_safe/app/packages/interfaces/auth_client.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final _auth = FirebaseAuthClient();
    Get
      ..lazyPut(LoginController.new)
      ..lazyPut(() => AuthRepo(_auth));
  }
}
