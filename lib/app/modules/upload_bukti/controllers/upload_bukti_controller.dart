import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:joki_apps/app/util/api.dart';
import 'dart:convert';

class UploadBuktiController extends GetxController {
  //TODO: Implement UploadBuktiController
  final ImagePicker _imagePicker = ImagePicker();
  var id_pending = ''.obs;
  late XFile image;
  var imageView = ''.obs;
  var api = Api();
  final storage = FlutterSecureStorage();
  var token;

  getImage() async {
    image = (await _imagePicker.pickImage(source: ImageSource.gallery))!;
    imageView.value = image.path;
  }

  sendPost() async {
    var lengh = image.path;
    var request = http.MultipartRequest(
        "POST", Uri.parse(Api.uploadBukti + '/${id_pending}'));
    request.headers.addAll(api.getHeaderPost(token));
    request.files.add(
      await http.MultipartFile.fromPath("image", lengh),
    );
    var ress = await request.send();

    print(ress.statusCode);
    ress.stream.transform(utf8.decoder).listen((event) {
      print(event);
      if (ress.statusCode == 200) {
        Get.offAllNamed('topup');
        Get.snackbar("message", "Success");
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    id_pending.value = Get.arguments.toString();
    token = await storage.read(key: 'token');
    print(id_pending);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
