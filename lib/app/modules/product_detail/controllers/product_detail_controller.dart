import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var id = 0.obs;
  //TODO: Implement ProductDetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments;
    print(id.value.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  confirm(
      BuildContext context, String tittle, String desc, String price) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          height: Get.height * 60 / 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Confirmation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text("Order Note"),
                    TextFormField(
                      minLines: 6,
                      maxLines: 6,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: "Input your account game"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product"),
                        Text(tittle),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price"),
                        Text(price),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Description"),
                        Text(desc),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 90 / 100,
                child: ElevatedButton(
                    onPressed: () => Get.toNamed('/order-recipe'),
                    child: Text("Confirm")),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
