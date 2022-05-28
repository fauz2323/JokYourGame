import 'package:cached_network_image/cached_network_image.dart';
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
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn.arstechnica.net/wp-content/uploads/2020/09/Google-Play-Store-logo.jpg",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
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
                    height: Get.height * 12 / 100,
                    width: Get.width,
                    padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dengan Joki Profesional",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 0.4,
                                      blurRadius: 0.4,
                                    ),
                                  ]),
                              child: Text("Pengalaman Terjamin"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 0.4,
                                      blurRadius: 0.4,
                                    ),
                                  ]),
                              child: Text("Pasti Puas"),
                            )
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                    width: Get.width,
                    height: Get.height * 10 / 100,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.people_alt_rounded,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "JokYourGame",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                              Text(
                                "Best assistant game platform",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.message,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    width: Get.width,
                    height: Get.height * 20 / 100,
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
                onPressed: () {},
                child: Text("Pesan Jasa"),
              ),
            ),
            Container(
              color: Colors.white,
              height: 10,
            )
          ],
        ));
  }
}
