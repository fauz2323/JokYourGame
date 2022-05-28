import 'package:get/get.dart';
import 'package:joki_apps/app/modules/splash/controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
}
