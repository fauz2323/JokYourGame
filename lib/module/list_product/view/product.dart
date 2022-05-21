import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/list_product/controller/product_controller.dart';

class Product extends GetView<ProductController> {
  const Product({Key? key}) : super(key: key);

  back() {
    Get.offNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("List Product ${Get.arguments}"),
          ),
          body: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: controller.productModel.list
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.all(8),
                              height: Get.height * 15 / 100,
                              width: Get.width * 90 / 100,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 0.6,
                                    blurRadius: 0.7,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Text(e.productName),
                                  Text(e.price),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
          )),
    );
  }
}
