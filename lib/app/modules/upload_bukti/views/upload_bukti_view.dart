import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_bukti_controller.dart';

class UploadBuktiView extends GetView<UploadBuktiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Bukti'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  controller.getImage();
                },
                child: Container(
                  height: Get.height * 25 / 100,
                  width: Get.width * 80 / 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 0.4,
                          spreadRadius: 0.4,
                        )
                      ]),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          size: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Add Bukti Pembayaran"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => controller.imageView.value != ''
                ? SizedBox(
                    height: Get.height * 40 / 100,
                    child: Image.file(File(controller.image.path)),
                  )
                : Center()),
            Spacer(),
            Container(
              margin: EdgeInsets.all(10),
              width: Get.width * 80 / 100,
              height: Get.height * 5 / 100,
              child: ElevatedButton(
                onPressed: () {
                  controller.sendPost();
                },
                child: Text("Upload Bukti Pembayaran"),
              ),
            )
          ],
        )));
  }
}
