import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/splash/controller/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("LOGO"),
            Text(
              "JOK YOUR GAME",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
