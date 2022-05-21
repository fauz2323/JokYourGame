import 'package:get/get.dart';
import 'package:joki_apps/module/auth/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
