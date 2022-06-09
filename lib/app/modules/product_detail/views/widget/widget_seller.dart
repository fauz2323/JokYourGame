import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetSeller extends StatelessWidget {
  const WidgetSeller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 10, right: 30),
      width: Get.width,
      height: Get.height * 10 / 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.people_alt_rounded,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JokYourGame",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                Text(
                  "Best assistant game platform",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
