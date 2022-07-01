import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 5 / 100),
                    Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 120,
                    ),
                    Text(
                      controller.userDataModel.userData.username,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: Get.width * 90 / 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0.4,
                            blurRadius: 0.4,
                            offset: Offset(1, 0.3),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Username"),
                              Text(controller.userDataModel.userData.username),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email"),
                              Text(controller.userDataModel.userData.email),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Balance"),
                              Text("Rp. " +
                                  controller.userDataModel.balance.toString()),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Join Date"),
                              Text(
                                  "${controller.userDataModel.userData.createdAt.day} - ${controller.userDataModel.userData.createdAt.month} - ${controller.userDataModel.userData.createdAt.year}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: Get.width * 90 / 100,
                      child: ElevatedButton(
                        onPressed: () => controller.confirm(
                          context,
                        ),
                        child: Text('Change Password'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
