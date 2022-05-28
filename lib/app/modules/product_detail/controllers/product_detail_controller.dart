import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var id = 0.obs;
  //TODO: Implement ProductDetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments;
    print(id.value.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
