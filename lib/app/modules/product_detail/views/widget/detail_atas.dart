import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_detail_controller.dart';

class DetailProductAtas extends StatelessWidget {
  const DetailProductAtas({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: Get.height * 40 / 100,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 30 / 100,
            child: CarouselSlider(
              options: CarouselOptions(height: Get.height),
              items: controller.imageProductModel.image.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      width: Get.width,
                      decoration: BoxDecoration(),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://www.jokyourgame.my.id/storage/" + i.path,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Rp. " + controller.productDetailModel.data.price.toString(),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30, top: 5),
              child: Text(controller.productDetailModel.data.productName),
            ),
          )
        ],
      ),
    );
  }
}
