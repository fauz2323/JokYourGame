import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:joki_apps/app/model/user_model.dart';
import 'dart:convert';

import 'package:joki_apps/app/util/api.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController
  final storage = FlutterSecureStorage();
  TextEditingController password = TextEditingController();
  var token;
  late UserDataModel userDataModel;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    token = await storage.read(key: 'token');
    initial();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  initial() async {
    final getDataUser = await http.get(
      Api.getDataUser,
      headers: Api().getHeaderGet(token),
    );

    var jsonData = jsonDecode(getDataUser.body);

    if (getDataUser.statusCode == 200 &&
        jsonData['message'] != 'Unauthicated.') {
      userDataModel = UserDataModel.fromJson(jsonData);
      isLoading.value = false;
    }
  }

  save() async {
    Get.back();
    isLoading.value = true;
    Map body = {'password': password.text};
    final changePassword = await http.post(
      Api.changePass,
      body: body,
      headers: Api().getHeaderPost(token),
    );
    password.text = '';
    print(changePassword.body);
    if (changePassword.statusCode != 200) {
      Get.snackbar("Error", "Connection Error");
    } else {
      Get.snackbar("Success", "Success Change Password");
    }
    isLoading.value = false;
  }

  confirm(
    BuildContext context,
  ) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 900,
          child: Center(
            child: ListView(
              children: <Widget>[
                const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(hintText: "New Password"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('Change Password'),
                  onPressed: () => save(),
                ),
                SizedBox(
                  height: Get.height * 60 / 100,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
