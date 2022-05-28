import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_all_topup_controller.dart';

class ListAllTopupView extends GetView<ListAllTopupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List TopUp'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: ListView(
                  children: controller.listTopUpModel.data
                      .map((e) => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            margin: EdgeInsets.all(10),
                            width: Get.width * 90 / 100,
                            height: Get.height * 20 / 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Nominal"),
                                    Text(
                                      e.total.toString(),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Code Uniq"),
                                    Text(
                                      e.codeUniq.toString(),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tanggal Transaksi"),
                                    Text(
                                      "${e.createdAt.day} - ${e.createdAt.month} - ${e.createdAt.year}",
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Status"),
                                    Text(
                                      e.status,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
