import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.path,
    required this.date,
    required this.status,
    required this.name,
    required this.price,
    required this.route,
    required this.review,
  }) : super(key: key);
  final String path;
  final String date;
  final String status;
  final String name;
  final String price;
  final String review;
  final VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width * 90 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 0.4,
              spreadRadius: 0.4),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.card_travel),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order"),
                  Text(date),
                ],
              ),
              Spacer(),
              Text(
                status,
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Divider(
            color: Colors.black,
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.network(
                  path,
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(name)
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Order Price'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(price),
              ),
              status == 'selesai' && review == 'not'
                  ? GestureDetector(
                      onTap: route,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Beri Ulasan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
