import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:joki_apps/model/product_model.dart';
import 'dart:convert';

import 'package:joki_apps/util/api.dart';

class ProductController extends GetxController {
  final storage = FlutterSecureStorage();
  var isLoading = true.obs;
  var token;
  var header = Api();
  late ProductModel productModel;

  initial() async {
    token = await storage.read(key: 'token');
    print(token);
    final getDataProduct = await http.post(
      Api.Product,
      body: {'game': Get.arguments},
      headers: header.getHeaderPost(token),
    );

    print(getDataProduct.body);
    if (getDataProduct.statusCode == 200) {
      productModel = ProductModel.fromJson(json.decode(getDataProduct.body));
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments);
    initial();
  }
}
