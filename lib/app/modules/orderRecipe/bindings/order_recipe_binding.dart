import 'package:get/get.dart';

import '../controllers/order_recipe_controller.dart';

class OrderRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRecipeController>(
      () => OrderRecipeController(),
    );
  }
}
