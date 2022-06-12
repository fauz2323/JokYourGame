import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joki_apps/app/model/order_recipe_model.dart';

import '../../../util/api.dart';

class OrderRecipeController extends GetxController {
  //TODO: Implement OrderRecipeController
  var storage = FlutterSecureStorage();
  var token;
  var api = Api();
  var id;
  var isLoading = true.obs;
  late OrderRecipeModel orderRecipeModel;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    token = await storage.read(key: 'token');
    id = Get.arguments.toString();
    initial();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  initial() async {
    print("object");
    final getDataRecipe = await http.post(Api.getRecipe,
        body: {'id': id}, headers: api.getHeaderPost(token));
    print(id);
    if (getDataRecipe.statusCode == 200) {
      var jsonData = json.decode(getDataRecipe.body);
      orderRecipeModel = OrderRecipeModel.fromJson(jsonData);
      isLoading.value = false;
    }
  }
}
