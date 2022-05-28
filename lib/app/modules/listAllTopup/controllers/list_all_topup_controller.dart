import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:joki_apps/app/model/list_topup.dart';
import 'package:joki_apps/app/util/api.dart';
import 'dart:convert';

class ListAllTopupController extends GetxController {
  //TODO: Implement ListAllTopupController

  final count = 0.obs;
  final storage = FlutterSecureStorage();
  var token;
  var api = Api();
  late ListTopUpModel listTopUpModel;
  var isLoading = true.obs;

  initial() async {
    token = await storage.read(key: 'token');
    final getDataTopup =
        await http.get(Api.topupList, headers: api.getHeaderGet(token));

    if (getDataTopup.statusCode == 200) {
      listTopUpModel = ListTopUpModel.fromJson(json.decode(getDataTopup.body));
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    initial();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
