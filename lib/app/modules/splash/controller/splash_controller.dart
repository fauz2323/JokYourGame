import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final storage = FlutterSecureStorage();
  var token;

  initial() async {
    token = await storage.read(key: 'token') ?? '';
    await Future.delayed(Duration(seconds: 3));

    if (token == '') {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }
}
