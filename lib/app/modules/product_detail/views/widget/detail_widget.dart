import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_detail_controller.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Detail",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                child: Text("Payment"),
                width: Get.width * 30 / 100,
              ),
              Text("Direct"),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              SizedBox(
                child: Text("Jenis Game"),
                width: Get.width * 30 / 100,
              ),
              Text(controller.productDetailModel.game),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              SizedBox(
                child: Text("Product added"),
                width: Get.width * 30 / 100,
              ),
              Text(
                  "${controller.productDetailModel.data.createdAt.day} - ${controller.productDetailModel.data.createdAt.month} - ${controller.productDetailModel.data.createdAt.year}"),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description:"),
              SizedBox(
                height: 20,
              ),
              Text(controller.productDetailModel.data.desc)
            ],
          )
        ],
      ),
    );
  }
}
