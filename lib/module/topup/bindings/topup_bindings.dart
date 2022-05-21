import 'package:get/get.dart';
import 'package:joki_apps/module/topup/controller/topup_controller.dart';

class TopUpBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TopUpController>(() => TopUpController());
  }
}
