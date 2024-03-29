import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/detail_atas.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/hero_porto.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/widget_profesional.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/widget_seller.dart';

import '../controllers/product_detail_controller.dart';
import 'widget/detail_widget.dart';
import 'widget/hero_porto_utama.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product detail'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          DetailProductAtas(controller: controller),
                          SizedBox(
                            height: 8,
                          ),
                          WidgetJokiProfesional(),
                          SizedBox(
                            height: 8,
                          ),
                          WidgetSeller(),
                          SizedBox(
                            height: 8,
                          ),
                          HeroWidgetPorto(controller: controller),
                          SizedBox(
                            height: 8,
                          ),
                          DetailWidget(
                            controller: controller,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 20),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Review',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: controller.reviewModel.review
                                      .map((e) => Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(e.user.username),
                                                    Text(
                                                        "${e.createdAt.day} - ${e.createdAt.month} - ${e.createdAt.year}")
                                                  ],
                                                ),
                                                Divider(
                                                  color: Colors.black,
                                                ),
                                                Text(e.review),
                                              ],
                                            ),
                                          ))
                                      .toList()
                                      .reversed
                                      .toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(color: Colors.white),
                      width: Get.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.toNamed('order-recipe');

                          controller.confirm(
                              context,
                              controller.productDetailModel.data.productName,
                              controller.productDetailModel.data.desc,
                              controller.productDetailModel.data.price);
                        },
                        child: Text("Pesan Jasa"),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 10,
                    )
                  ],
                ),
        ));
  }
}
