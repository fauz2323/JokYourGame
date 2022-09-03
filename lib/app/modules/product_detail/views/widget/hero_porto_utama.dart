import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_detail_controller.dart';
import 'hero_porto.dart';

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
      height:
          controller.portofolioModel.data == '-' ? 100 : Get.height * 20 / 100,
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
          controller.portofolioModel.data == '-'
              ? Center(
                  child: Text('Portofolio not added'),
                )
              : Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: controller.portofolioModel.porto
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return HeroPortofolio(
                                      uri:
                                          'https://www.jokyourgame.my.id/storage/' +
                                              e.path,
                                    );
                                  }));
                                },
                                child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Hero(
                                      tag: 'porto-hero',
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://www.jokyourgame.my.id/storage/' +
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
      ),
    );
  }
}
