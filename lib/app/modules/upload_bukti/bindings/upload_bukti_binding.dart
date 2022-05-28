import 'package:get/get.dart';

import '../controllers/upload_bukti_controller.dart';

class UploadBuktiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UploadBuktiController>(
      UploadBuktiController(),
    );
  }
}
