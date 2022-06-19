import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../util/api.dart';

class ReviewController extends GetxController {
  //TODO: Implement ReviewController
  final storage = FlutterSecureStorage();
  var token;
  var isLoading = true.obs;
  var api = Api();
  var idProduct;
  var idOrder;

  @override
  void onInit() {
    super.onInit();
    idOrder = Get.arguments['order_id'];
    idProduct = Get.arguments['product_id'];
    print([idOrder, idProduct]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
