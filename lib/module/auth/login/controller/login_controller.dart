import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joki_apps/util/api.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var storage = FlutterSecureStorage();

  login() async {
    loading.value = true;
    print("object");
    Map body = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    final response = await http
        .post(
          Api.login,
          body: body,
        )
        .timeout(
          Duration(seconds: 5),
          onTimeout: (() => http.Response('err', 500)),
        );

    var jsonData = json.decode(response.body);
    print(jsonData);

    if (response.statusCode == 200) {
      if (jsonData['code'] == '000') {
        loading.value = false;
        Get.snackbar("Message", "Username/Password Salah");
      } else {
        await storage.write(key: 'token', value: jsonData['token']);
        Get.offAllNamed('/home');
      }
    }
    loading.value = false;
  }
}
