import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var storage = FlutterSecureStorage();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  login() async {
    isLoading = true;
    print("object");
    Map body = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    final response = await http
        .post(
          Uri.parse('http://192.168.105.155:8000/api/login'),
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
      return null;
    } else {
      await storage.write(key: 'token', value: jsonData['token']);
      isLoading = false;
      return "done";
    }
  }
}
