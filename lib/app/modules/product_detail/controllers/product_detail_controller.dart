import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:joki_apps/app/model/image_product_model.dart';
import 'dart:convert';

import '../../../model/potofolio_model.dart';
import '../../../model/product_detail_model.dart';
import '../../../util/api.dart';

class ProductDetailController extends GetxController {
  var id = 0.obs;
  final storage = FlutterSecureStorage();
  var token;
  var tittle = ''.obs;
  late ProductDetailModel productDetailModel;
  late PortofolioModel portofolioModel;
  late ImageProductModel imageProductModel;
  var api = Api();
  var isLoading = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments;
    initial();
    print(id.value.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  initial() async {
    token = await storage.read(key: 'token');
    Map body = {
      'id': id.value.toString(),
    };
    final getDetailProduct = await http
        .post(Api.detailProduct, body: body, headers: api.getHeaderPost(token))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('err', 500);
    });

    final getDetailPorto = await http
        .post(Api.portofolio, body: body, headers: api.getHeaderPost(token))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('err', 500);
    });

    final getImageProduct = await http
        .post(Api.imageProduct, body: body, headers: api.getHeaderPost(token))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('err', 500);
    });

    if (getDetailProduct.statusCode == 200) {
      var imageData = json.decode(getImageProduct.body);
      var jsonData = json.decode(getDetailProduct.body);
      var jsonDataPorto = json.decode(getDetailPorto.body);
      print(jsonDataPorto);

      imageProductModel = ImageProductModel.fromJson(imageData);
      productDetailModel = ProductDetailModel.fromJson(jsonData);
      portofolioModel = PortofolioModel.fromJson(jsonDataPorto);

      tittle.value = productDetailModel.data.productName;
      isLoading.value = false;
    } else {
      Get.offAllNamed('/login');
    }
  }

  confirm(
      BuildContext context, String tittle, String desc, String price) async {
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
                    "Order Confirmation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text("Order Note"),
                    TextFormField(
                      minLines: 6,
                      maxLines: 6,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: "Input your account game"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product"),
                        Text(tittle),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price"),
                        Text(price),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Description"),
                        Text(desc),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 90 / 100,
                child: ElevatedButton(
                    onPressed: () => Get.toNamed('/order-recipe'),
                    child: Text("Confirm")),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    print('onClose');
  }

  void increment() => count.value++;
}
