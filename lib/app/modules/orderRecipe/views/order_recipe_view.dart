import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_recipe_controller.dart';

class OrderRecipeView extends GetView<OrderRecipeController> {
  back() {
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                height: Get.height * 20 / 100,
                width: Get.width,
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recipt",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    "12/12/2022",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bank Transfer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    controller
                                        .orderRecipeModel.orderList.status,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 6 / 100,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: Get.width * 50 / 100,
                                  height: Get.height * 8 / 100,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "ORDER DETAIL",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 5 / 100,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                width: Get.width * 70 / 100,
                                height: Get.height * 40 / 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        spreadRadius: 0.4,
                                        blurRadius: 0.4),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    RowRecipe(
                                      tittel: "Username",
                                      data: controller.orderRecipeModel
                                          .orderList.user.username,
                                    ),
                                    RowRecipe(
                                      tittel: "Email",
                                      data: controller.orderRecipeModel
                                          .orderList.user.email,
                                    ),
                                    RowRecipe(
                                      tittel: "Phone",
                                      data: controller.orderRecipeModel
                                          .orderList.user.phone,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RowRecipe(
                                      tittel: "Product",
                                      data: controller.orderRecipeModel
                                          .orderList.product.productName,
                                    ),
                                    RowRecipe(
                                      tittel: "Price",
                                      data: controller
                                          .orderRecipeModel.orderList.price
                                          .toString(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Order Note"),
                                    Text(controller
                                        .orderRecipeModel.orderList.note),
                                  ],
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: Get.width * 80 / 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.offAllNamed('/home');
                                    },
                                    child: Text("Ok")),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                  ))
            ],
          )),
    );
  }
}

class RowRecipe extends StatelessWidget {
  const RowRecipe({
    Key? key,
    required this.tittel,
    required this.data,
  }) : super(key: key);
  final String tittel;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittel),
          Text(data),
        ],
      ),
    );
  }
}
