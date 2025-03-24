import 'package:get/get.dart';
import 'package:tugas_pertemuan_3/app/modules/auth/views/login_view.dart';
import 'package:tugas_pertemuan_3/app/modules/auth/views/register_view.dart';
import 'package:tugas_pertemuan_3/app/modules/home/views/detail_home_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
      name: _Paths.AUTH,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),GetPage(
      name: _Paths.DETAIL,
      page: () => DetailHomeView(),
      binding: AuthBinding(),
    ),
  ];
}
