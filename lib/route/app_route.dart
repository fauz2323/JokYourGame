part of 'page_route.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Path.SPLASH;
  static const LOGIN = _Path.LOGIN;
  static const REGISTER = _Path.REGISTER;
  static const TOPUP = _Path.TOPUP;
  static const HOME = _Path.HOME;
  static const PRODUCT = _Path.PRODUCT;
}

abstract class _Path {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const TOPUP = '/topup';
  static const REGISTER = '/register';
  static const PRODUCT = '/product';
}
