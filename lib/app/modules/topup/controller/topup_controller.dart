import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:joki_apps/app/model/topup_model.dart';
import 'package:joki_apps/app/modules/topup/view/invoice.dart';
import 'dart:convert';

import 'package:joki_apps/app/util/api.dart';

class TopUpController extends GetxController {
  TextEditingController nominal = TextEditingController();
  var token;
  final storage = FlutterSecureStorage();
  var isLoadinbg = false.obs;
  var header = Api();
  late TopUpModel topUpModel;

  topup() async {
    isLoadinbg.value = true;
    token = await storage.read(key: 'token');
    Map body = {
      'total': nominal.text,
      'ket': "Top up saldo sebesar ${nominal.text}"
    };
    final topupPosRequest = await http.post(Api.Topup,
        headers: header.getHeaderPost(token), body: body);

    if (topupPosRequest.statusCode == 200) {
      topUpModel = TopUpModel.fromJson(json.decode(topupPosRequest.body));
      print("secces");
      Map dataArgument = {
        'total': topUpModel.data.total,
        'code': topUpModel.data.codeUniq,
        'ket': topUpModel.data.ket,
        'status': topUpModel.data.status,
        'tanggal':
            "${topUpModel.data.createdAt.day} - ${topUpModel.data.createdAt.month} - ${topUpModel.data.createdAt.year}"
      };
      Get.offAll(() => InvoiceTopup(), arguments: dataArgument);
    } else {
      Get.snackbar("Message", "Error connect server");
    }
    isLoadinbg.value = false;
  }
}
