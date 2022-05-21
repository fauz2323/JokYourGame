import 'package:get/get.dart';
import 'package:joki_apps/module/auth/login/bindings/login_binding.dart';
import 'package:joki_apps/module/auth/login/view/login.dart';
import 'package:joki_apps/module/auth/register/bindings/register_bindings.dart';
import 'package:joki_apps/module/auth/register/view/register.dart';
import 'package:joki_apps/module/home/bindings/home_bindings.dart';
import 'package:joki_apps/module/home/view/home.dart';
import 'package:joki_apps/module/list_product/bindings/product_bindings.dart';
import 'package:joki_apps/module/list_product/view/product.dart';
import 'package:joki_apps/module/splash/bindings/splas_bindings.dart';
import 'package:joki_apps/module/splash/view/splash.dart';
import 'package:joki_apps/module/topup/bindings/topup_bindings.dart';
import 'package:joki_apps/module/topup/view/topup.dart';

part 'app_route.dart';

abstract class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Path.SPLASH,
      page: () => Splash(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: _Path.LOGIN,
      page: () => Login(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: _Path.REGISTER,
      page: () => Register(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: _Path.HOME,
      page: () => Home(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Path.TOPUP,
      page: () => TopUp(),
      binding: TopUpBindings(),
    ),
    GetPage(
      name: _Path.PRODUCT,
      page: () => Product(),
      binding: ProductBindings(),
    ),
  ];
}
