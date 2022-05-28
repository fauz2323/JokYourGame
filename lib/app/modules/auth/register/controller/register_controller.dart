import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:joki_apps/app/util/api.dart';

class RegisterCOntroller extends GetxController {
  var isLoading = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final storage = FlutterSecureStorage();

  register() async {
    isLoading.value = true;
    Map body = {
      'username': username.text,
      'email': email.text,
      'password': password.text,
      'phone': number.text,
    };
    final registerResponse = await http.post(Api.register, body: body);
    print(registerResponse.body);
    if (registerResponse.statusCode == 200) {
      var jsonData = json.decode(registerResponse.body);
      if (jsonData['code'] == '002') {
        await storage.write(key: 'token', value: jsonData['data']['token']);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Message", jsonData['message']);
      }
    } else {
      Get.snackbar("Message", "Connection Error");
    }

    isLoading.value = false;
  }
}
