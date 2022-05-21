import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:joki_apps/model/auth_model.dart';
import 'package:joki_apps/model/game_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:joki_apps/util/api.dart';

class HomeCOntroller extends GetxController {
  var token;
  final storage = FlutterSecureStorage();
  late GameListModel gameListModel;
  late AuthModel authModel;
  late Map<String, String> header;
  var loading = true.obs;

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

    if (getDataGame.statusCode == 500 || getDataUser.statusCode == 500) {
      Get.offAllNamed('login');
    }

    var jsonDecodeGameList = json.decode(getDataGame.body);
    gameListModel = GameListModel.fromJson(jsonDecodeGameList);
    authModel = AuthModel.fromJson(json.decode(getDataUser.body));
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
}
