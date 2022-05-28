import 'package:get/get.dart';
import 'package:joki_apps/app/modules/auth/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
