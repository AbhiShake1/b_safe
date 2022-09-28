import 'package:b_safe/app/modules/home/bindings/home_binding.dart';
import 'package:b_safe/app/modules/home/views/home_view.dart';
import 'package:b_safe/app/modules/login/bindings/login_binding.dart';
import 'package:b_safe/app/modules/login/middlewares/login_middleware.dart';
import 'package:b_safe/app/modules/login/views/login_view.dart';
import 'package:b_safe/app/modules/profile/bindings/profile_binding.dart';
import 'package:b_safe/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      middlewares: [
        LoginMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
