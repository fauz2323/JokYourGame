import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetJokiProfesional extends StatelessWidget {
  const WidgetJokiProfesional({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height * 12 / 100,
      width: Get.width,
      padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dengan Joki Profesional",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 0.4,
                        blurRadius: 0.4,
                      ),
                    ]),
                child: Text("Pengalaman Terjamin"),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 0.4,
                        blurRadius: 0.4,
                      ),
                    ]),
                child: Text("Pasti Puas"),
              )
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
