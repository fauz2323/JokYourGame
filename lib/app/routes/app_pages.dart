import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/view/login.dart';
import '../modules/auth/register/bindings/register_bindings.dart';
import '../modules/auth/register/view/register.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/view/home.dart';
import '../modules/listAllTopup/bindings/list_all_topup_binding.dart';
import '../modules/listAllTopup/views/list_all_topup_view.dart';
import '../modules/list_product/bindings/product_bindings.dart';
import '../modules/list_product/view/product.dart';
import '../modules/orderRecipe/bindings/order_recipe_binding.dart';
import '../modules/orderRecipe/views/order_recipe_view.dart';
import '../modules/pending-topup/bindings/pending_topup_binding.dart';
import '../modules/pending-topup/views/pending_topup_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/splash/bindings/splas_bindings.dart';
import '../modules/splash/view/splash.dart';
import '../modules/topup/bindings/topup_bindings.dart';
import '../modules/topup/view/topup.dart';
import '../modules/upload_bukti/bindings/upload_bukti_binding.dart';
import '../modules/upload_bukti/views/upload_bukti_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => Splash(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => Login(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => Register(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.TOPUP,
      page: () => TopUp(),
      binding: TopUpBindings(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => Product(),
      binding: ProductBindings(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_BUKTI,
      page: () => UploadBuktiView(),
      binding: UploadBuktiBinding(),
    ),
    GetPage(
      name: _Paths.PENDING_TOPUP,
      page: () => PendingTopupView(),
      binding: PendingTopupBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ALL_TOPUP,
      page: () => ListAllTopupView(),
      binding: ListAllTopupBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_RECIPE,
      page: () => OrderRecipeView(),
      binding: OrderRecipeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
