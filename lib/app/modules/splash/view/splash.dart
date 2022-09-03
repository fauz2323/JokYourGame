import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/modules/splash/controller/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'image/LOGO.png',
              width: w * 80 / 100,
            ),
          ],
        ),
      ),
    );
  }
}
