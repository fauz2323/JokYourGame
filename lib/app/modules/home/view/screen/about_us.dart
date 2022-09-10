// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/modules/home/controller/home_controller.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key, required this.homeCOntroller}) : super(key: key);
  final HomeCOntroller homeCOntroller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "About Apps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.4),
              ),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(homeCOntroller.about.value),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
