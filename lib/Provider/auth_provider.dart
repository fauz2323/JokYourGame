import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:joki_apps/module/auth/register/view/register.dart';
import 'package:joki_apps/module/home/view/home.dart';
import 'package:joki_apps/util/api.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController registerUsername = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerNumber = TextEditingController();
  var storage = FlutterSecureStorage();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  login() async {
    try {
      isLoading = true;
      print("object");
      Map body = {
        'username': usernameController.text,
        'password': passwordController.text,
      };
      final response = await http
          .post(
            Uri.parse(Api.baseUrl + '/api/login'),
            body: body,
          )
          .timeout(
            Duration(seconds: 5),
            onTimeout: (() => http.Response('err', 500)),
          );

      var jsonData = json.decode(response.body);
      print(jsonData);

      if (jsonData['code'] == '000') {
        isLoading = false;
        Get.snackbar("Error", "Username/Password Salah");
      } else {
        await storage.write(key: 'token', value: jsonData['token']);
        isLoading = false;
        Get.offAll(() => Home());
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar("Error", "Error Connection to server");
    }
  }

  register() async {
    try {
      isLoading = true;
      Map body = {
        'username': registerUsername.text,
        'email': registerEmail.text,
        'password': registerPassword.text,
        'phone': registerNumber.text,
      };

      final response = await http
          .post(
            Uri.parse(Api.baseUrl + '/api/login'),
            body: body,
          )
          .timeout(
            Duration(seconds: 5),
            onTimeout: (() => http.Response('err', 500)),
          );

      var jsonData = json.decode(response.body);
      print(jsonData);

      if (jsonData['code'] == '001') {
        await storage.write(key: 'token', value: jsonData['data']['token']);
        Get.offAll(() => Home());
      } else if (jsonData['code'] == '000') {
        Get.snackbar("Error", jsonData['message']);
      } else if (jsonData['code'] == '001') {
        Get.snackbar("Error", jsonData['message']);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Get.snackbar("Error", "Error to connect server");
    }
  }
}
