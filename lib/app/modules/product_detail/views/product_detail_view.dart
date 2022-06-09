import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/detail_atas.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/hero_porto.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/widget_profesional.dart';
import 'package:joki_apps/app/modules/product_detail/views/widget/widget_seller.dart';

import '../controllers/product_detail_controller.dart';

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
                          HeroWidgetPorto(controller: controller)
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
                              context, "Paket Joki 01", "Deskripsi", '140.000');
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

class HeroWidgetPorto extends StatelessWidget {
  const HeroWidgetPorto({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 10),
        decoration: BoxDecoration(color: Colors.white),
        height: Get.height * 20 / 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: Text(
                  "Portofolio",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: controller.imageProductModel.image
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return HeroPortofolio(
                                  uri: 'http://10.0.2.2:8000/storage/' + e.path,
                                );
                              }));
                            },
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Hero(
                                  tag: 'porto-hero',
                                  child: CachedNetworkImage(
                                    imageUrl: 'http://10.0.2.2:8000/storage/' +
                                        e.path,
                                  ),
                                )),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
