import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/model/auth_model.dart';
import 'package:joki_apps/app/model/game_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:joki_apps/app/util/api.dart';

class HomeCOntroller extends GetxController {
  var token;
  final storage = FlutterSecureStorage();
  late GameListModel gameListModel;
  late AuthModel authModel;
  late Map<String, String> header;
  var loading = true.obs;
  var about = ''.obs;
  var balance = 0.obs;

  initial() async {
    token = await storage.read(key: 'token');
    header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final getDataGame = await http.get(Api.GameList, headers: header).timeout(
          Duration(seconds: 10),
          onTimeout: () => http.Response('error', 500),
        );

    final getDataUser = await http.get(Api.AUTH, headers: header).timeout(
          Duration(seconds: 10),
          onTimeout: () => http.Response('error', 500),
        );

    final getAbout = await http
        .get(
          Api.about,
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => http.Response('error', 500),
        );

    if (getDataUser.statusCode == 401) {
      storage.deleteAll();
      return Get.offAllNamed('login');
    }

    if (getDataGame.statusCode == 500 || getDataUser.statusCode == 500) {
      Get.offAllNamed('login');
    }

    var jsonDecodeGameList = json.decode(getDataGame.body);
    gameListModel = GameListModel.fromJson(jsonDecodeGameList);
    authModel = AuthModel.fromJson(json.decode(getDataUser.body));
    balance.value = authModel.data.balance;
    about.value = json.decode(getAbout.body)['about'];
    loading.value = false;
  }

  logout() async {
    await storage.deleteAll();
    Get.offAllNamed('/login');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }

  getBalance() async {
    header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final getBalance = await http.get(Api.getBalance, headers: header).timeout(
          Duration(seconds: 10),
          onTimeout: () => http.Response('error', 500),
        );

    if (getBalance.statusCode == 200) {
      var getBalanceJson = json.decode(getBalance.body);
      print(getBalanceJson);

      balance.value = getBalanceJson['Balance'];
    }
  }
}
