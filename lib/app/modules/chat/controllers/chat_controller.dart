import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:joki_apps/app/util/api.dart';

import '../../../model/message_model.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController
  TextEditingController messageController = TextEditingController();
  var messageModel = <MessageModel>[].obs;
  var token;
  final storage = FlutterSecureStorage();
  var isLoading = true.obs;
  var api = Api();

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
  void onClose() {
    print("onClose");
  }

  initial() async {
    final getDataMessage = await http
        .get(Api.getMessage, headers: api.getHeaderGet(token))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('error', 500);
    });

    if (getDataMessage.statusCode == 200) {
      var dataJson = json.decode(getDataMessage.body);
      for (var data in dataJson) {
        messageModel.add(MessageModel.fromJson(data));
      }
      isLoading.value = false;
    }
  }

  sendMessage(String message) async {
    isLoading.value = true;
    Map data = {
      'message': message,
    };
    final sendDataMessage = await http.post(Api.sendMessage,
        headers: api.getHeaderPost(token), body: data);

    if (sendDataMessage.statusCode == 200) {
      var jsonData = json.decode(sendDataMessage.body);
      print(jsonData);

      messageModel.add(MessageModel.fromJson(jsonData));
    }
    isLoading.value = false;
  }
}
