import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ProductDetailView'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: Get.height * 40 / 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 30 / 100,
                          child: CarouselSlider(
                            options: CarouselOptions(height: Get.height),
                            items: [1, 2, 3, 4, 5, 6].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    margin: EdgeInsets.all(2),
                                    width: Get.width,
                                    decoration: BoxDecoration(),
                                    child: Image.network(
                                      'https://cdn.arstechnica.net/wp-content/uploads/2020/09/Google-Play-Store-logo.jpg',
                                      fit: BoxFit.cover,
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
                              "Rp 24.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, top: 5),
                            child: Text("Joki Package 1 Premium"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.white,
                    height: Get.height * 40 / 100,
                    width: Get.width,
                  )
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 90 / 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Pesan Jasa"),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
