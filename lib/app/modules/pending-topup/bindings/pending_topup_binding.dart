import 'package:get/get.dart';

import '../controllers/pending_topup_controller.dart';

class PendingTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PendingTopupController(),
    );
  }
}
