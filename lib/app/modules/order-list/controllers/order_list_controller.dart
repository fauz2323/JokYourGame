import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController reviewController = TextEditingController();

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
    print("object Close");
  }

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

  review(
      BuildContext context, int idProduct, int idOrder, String product) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          height: Get.height * 60 / 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review Order",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: Get.height * 6 / 100,
              ),
              TextFormField(
                controller: reviewController,
                minLines: 6,
                maxLines: 6,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: "Input your order review"),
              ),
              Spacer(),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () => sendReview(idProduct, idOrder),
                  child: Text("Send Review"),
                ),
                width: Get.width * 90 / 100,
              )
            ],
          ),
        );
      },
    );
  }

  sendReview(int idProduct, int idOrder) async {
    isLoading.value = true;
    Get.back();
    Map body = {
      'order_id': idOrder.toString(),
      'product_id': idProduct.toString(),
      'review': reviewController.text,
    };

    final sendReviewData = await http
        .post(Api.sendReview, body: body, headers: api.getHeaderPost(token))
        .timeout(
      Duration(seconds: 10),
      onTimeout: () {
        return http.Response('err', 500);
      },
    );

    print(sendReviewData.body);
    if (sendReviewData.statusCode == 200) {
      final getDataListOrder = await http
          .get(Api.orderList, headers: api.getHeaderGet(token))
          .timeout(Duration(seconds: 10), onTimeout: () {
        return http.Response('error', 500);
      });

      var dataJson = json.decode(getDataListOrder.body);
      print(dataJson);
      await Future.delayed(Duration(seconds: 3));

      if (getDataListOrder.statusCode == 200) {
        orderListModel = OrderListModel.fromJson(dataJson);
        isLoading.value = false;
      } else {
        Get.back();
      }
    } else {
      isLoading.value = false;

      Get.snackbar("Error", "Connection error");
    }
  }
}
