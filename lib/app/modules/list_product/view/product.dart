import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/modules/list_product/controller/product_controller.dart';

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
            title: Text("List Product ${controller.tittle}"),
          ),
          body: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: controller.gameListModelNew.list
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Get.toNamed(
                                  '/product-detail',
                                  arguments: e.id,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                height: Get.height * 15 / 100,
                                width: Get.width * 90 / 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 0.3,
                                      blurRadius: 0.3,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        width: Get.width * 40 / 100,
                                        height: Get.height * 15 / 100,
                                        imageUrl:
                                            'https://www.jokyourgame.my.id/storage/' +
                                                e.image.first.path,
                                        placeholder: (context, uri) =>
                                            CircularProgressIndicator(),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.productName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "Rp " + e.price,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          Text(
                                            controller.tittle.value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Align(
                                        child: Icon(Icons.arrow_right),
                                        alignment: Alignment.bottomLeft,
                                      )
                                    ],
                                  ),
                                ),
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
