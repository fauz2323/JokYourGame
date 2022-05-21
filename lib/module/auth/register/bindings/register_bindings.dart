import 'package:get/get.dart';
import 'package:joki_apps/module/auth/register/controller/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RegisterCOntroller>(
      () => RegisterCOntroller(),
    );
  }
}
