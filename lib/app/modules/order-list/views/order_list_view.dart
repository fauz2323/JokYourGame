import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:joki_apps/app/modules/order-list/views/widget/order_card.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order List'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: controller.orderListModel.orderList
                        .map(
                          (e) => OrderCard(
                            review: e.review,
                            status: e.status,
                            name: e.product.productName,
                            path:
                                'https://www.kibrispdr.org/data/981/trolley-icon-png-10.png',
                            date:
                                "${e.createdAt.day} - ${e.createdAt.month} - ${e.createdAt.year}",
                            price: e.price.toString(),
                            route: () => controller.review(context, e.productId,
                                e.id, e.product.productName),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ));
  }
}
