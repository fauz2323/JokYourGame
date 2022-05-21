import 'package:get/get.dart';
import 'package:joki_apps/module/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeCOntroller>(
      HomeCOntroller(),
    );
  }
}
