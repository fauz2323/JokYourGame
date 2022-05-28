import 'package:get/get.dart';

import '../controllers/list_all_topup_controller.dart';

class ListAllTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListAllTopupController>(
      ListAllTopupController(),
    );
  }
}
