import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:joki_apps/app/model/pending_topup.dart';
import 'package:joki_apps/app/util/api.dart';
import 'dart:convert';

class PendingTopupController extends GetxController {
  //TODO: Implement PendingTopupController
  var listData = ''.obs;
  final storage = FlutterSecureStorage();
  var token;
  Api api = Api();
  late PendingTopUpModel pendingTopUp;
  var isLoading = true.obs;

  inital() async {
    token = await storage.read(key: 'token');
    final GetDataTopUp =
        await http.get(Api.allPending, headers: api.getHeaderGet(token));

    if (GetDataTopUp.statusCode == 200) {
      pendingTopUp = PendingTopUpModel.fromJson(json.decode(GetDataTopUp.body));
      isLoading.value = false;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    inital();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
