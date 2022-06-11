import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:joki_apps/app/model/order_list_model.dart';
import 'package:joki_apps/app/util/api.dart';

class OrderListController extends GetxController {
  //TODO: Implement OrderListController
  var token;
  final storage = FlutterSecureStorage();
  var api = Api();
  var isLoading = true.obs;
  late OrderListModel orderListModel;

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
    final getDataListOrder = await http
        .get(Api.orderList, headers: api.getHeaderGet(token))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('error', 500);
    });

    var dataJson = json.decode(getDataListOrder.body);
    print(dataJson);
    if (getDataListOrder.statusCode == 200) {
      orderListModel = OrderListModel.fromJson(dataJson);
      isLoading.value = false;
    } else {
      Get.back();
    }
  }
}
