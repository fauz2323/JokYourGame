import 'package:get/get.dart';
import 'package:joki_apps/module/list_product/controller/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProductController>(ProductController());
  }
}
