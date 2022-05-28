import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pending_topup_controller.dart';

class PendingTopupView extends GetView<PendingTopupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pending Topup'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: ListView(
                  children: controller.pendingTopUp.data
                      .map((e) => InkWell(
                            onTap: () {
                              Get.toNamed('upload-bukti', arguments: e.id);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              margin: EdgeInsets.all(10),
                              width: Get.width * 90 / 100,
                              height: Get.height * 15 / 100,
                              child: Column(
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
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
